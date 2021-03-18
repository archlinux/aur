# Maintainer  : 33KK

pkgname=flameshot-33kk-git
_pkgname=flameshot
pkgver=r1317.c01b3ce
pkgrel=1
pkgdesc="Powerful yet simple to use screenshot software (with custom command uploader)"
arch=('i686' 'x86_64')
url="https://github.com/33kk/flameshot"
license=('GPL')
depends=(qt5-base hicolor-icon-theme qt5-svg)
makedepends=(qt5-tools git cmake)
provides=(flameshot-git)
conflicts=(flameshot)
source=("git+https://github.com/33kk/flameshot.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
