# Maintainer  : Feresey <p.milko1999@yandex.ru>
# Contributor : j1simon <stemp@ono.com>
# Contributor : Feresey <p.milko1999@yandex.ru>

pkgname=flameshot-git
_pkgname=flameshot
pkgver=r707.ceb51a9
pkgrel=1
pkgdesc="Powerful yet simple to use screenshot software"
arch=('i686' 'x86_64')
url="https://github.com/flameshot-org/flameshot"
license=('GPL')
depends=(qt5-base hicolor-icon-theme qt5-svg)
makedepends=(qt5-tools git cmake)
provides=(flameshot-git)
conflicts=(flameshot)
source=("git+https://github.com/flameshot-org/flameshot.git")
md5sums=('SKIP')

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
