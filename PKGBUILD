# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=vaults-git
_pkgname=Vaults
pkgver=0.1.0.r14.ge56f714
pkgrel=1
pkgdesc="An application for creating encrypted vaults for the GNOME desktop"
arch=('any')
url="https://github.com/mpobaschnig/Vaults"
license=('GPL3')
depends=('glib2' 'gtk4')
makedepends=('meson' 'rust')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
md5sums=('SKIP') #autofill using updpkgsums

pkgver() {
    cd "$srcdir/${_pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson ${_pkgname%-git} build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
