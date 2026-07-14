# Maintainer:

_pkgname="gigolo"
pkgname="$_pkgname-git"
pkgver=0.6.0.r155.gf762a0d
pkgrel=1
pkgdesc="Remote filesystem management frontend"
url="https://gitlab.xfce.org/apps/gigolo"
license=('GPL-2.0-or-later')
arch=('x86_64')

depends=(
  'gtk3'
  'gvfs'
)
makedepends=(
  'git'
  'meson'
  'xfce4-dev-tools'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --match='gigolo-*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
