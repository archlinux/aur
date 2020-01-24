# Maintainer  : Feresey <p.milko1999@yandex.ru>
# Contributor : j1simon <stemp@ono.com>
# Contributor : Feresey <p.milko1999@yandex.ru>

pkgname=flameshot-git
_pkgname=flameshot
pkgver=r549.91ba28c
pkgrel=3
pkgdesc="Powerful yet simple to use screenshot software"
arch=('i686' 'x86_64')
url="https://github.com/lupoDharkael/flameshot"
license=('GPL')
depends=(qt5-base hicolor-icon-theme qt5-svg)
makedepends=(qt5-tools git)
provides=(flameshot-git)
conflicts=(flameshot)
source=("git+https://github.com/lupoDharkael/flameshot.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  qmake CONFIG+=packaging
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make INSTALL_ROOT="${pkgdir}" install
}
