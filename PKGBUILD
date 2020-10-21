# Maintainer: Kavya Gokul <hello @ properlypurple.com>

pkgname=braus-git
_pkgname=braus
pkgver=r5.e8e94a5
pkgrel=1
epoch=1
pkgdesc="Application to select a browser every time you click a link anywhere"
url="https://github.com/properlypurple/braus"
arch=(any)
license=(GPL3)
depends=(gsettings-desktop-schemas glib2 pango gtk3 python-gobject)
makedepends=(gobject-introspection git meson)
provides=(braus)
source=("git+https://github.com/properlypurple/braus")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd ${srcdir}/braus
  meson build --prefix=/usr
}

package() {
  cd ${srcdir}/braus/build
  ninja
  DESTDIR="$pkgdir" ninja install
}
