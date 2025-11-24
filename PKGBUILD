# Maintainer: Pablo Lezaeta Reyes (JotaRandom) <prflr88@gmail.com>
# Contributor: ark Wagie (yochananmarqos) <mark.wagie@proton.me>

pkgname=xapp-symbolic-icons-git
pkgver=1.0.2+0
pkgrel=1
pkgdesc="A set of symbolic icons for GTK applications and projects (git)"
arch=('any')
url="https://github.com/xapp-project/xapp-symbolic-icons"
license=('GPL-3.0-only' 'LGPL-3.0-only')
depends=(
  'hicolor-icon-theme'
  'python'
)
makedepends=(
  'git'
  'meson'
)
provides=('xapp-symbolic-icons' 'xsi-symbolic-icons')
conflicts=('xapp-symbolic-icons' 'xsi-symbolic-icons')
source=("${pkgname}::git+https://github.com/xapp-project/xapp-symbolic-icons.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  echo "$(git describe --long | sed -r 's/-([0-9,a-g,A-G]{7}.*)//' | sed 's/-/+/' | sed 's/v//g' )"
}

build() {
  arch-meson "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
