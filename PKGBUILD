# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>
# Contributor: Sebastian Gumprich <aur at gumpri dot ch>
# Contributor: shimi <shimi.chen@gmail.com>
# Contributor: Gustavo Castro <gustawho at gmail dot com>

# Thank you for patch file @kkyy
# https://aur.archlinux.org/packages/indicator-kdeconnect-git/#comment-794608

pkgname=indicator-kdeconnect-git
pkgver=r625.669bdd5
pkgrel=2
_pkgname=indicator-kdeconnect
pkgdesc="Integrate KDEConnect on desktop environments that use AppIndicators (e.g. Unity)"
arch=('x86_64')
url="https://github.com/b4j4/indicator-kdeconnect"
license=('GPL')
conflicts=('indicator-kdeconnect')
provides=('indicator-kdeconnect')
depends=('libappindicator-gtk3' 'kdeconnect' 'vala' 'python-requests-oauthlib' 'python-gobject' 'libgee')
makedepends=('git' 'meson' 'ninja')
source=(
  'git+https://github.com/b4j4/indicator-kdeconnect.git'
  'fix-build.patch'
)

sha256sums=(
  'SKIP'
  '91085b7e77d143b438ba2564b70e4537ad1bd89f1f218e4df39e97e9a6419f19'
)

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  patch --forward --strip=1 --input="${srcdir}/fix-build.patch"
}

build() {
  arch-meson ${_pkgname} build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
