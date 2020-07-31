# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=sdcv-git
pkgver=0.5.2.r23.g995bdc5
pkgrel=1
pkgdesc="StarDict Console Version"
arch=('x86_64')
url="https://dushistov.github.io/sdcv/"
license=('GPL')
depends=('glib2' 'readline' 'zlib')
makedepends=('cmake' 'git')
provides=('sdcv')
conflicts=('sdcv')
source=('git+https://github.com/Dushistov/sdcv.git')
md5sums=('SKIP')

_gitname=sdcv

pkgver() {
  cd "${srcdir}/${_gitname}"

  # Get the version number.
  git describe --long | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "${srcdir}/${_gitname}"

  install -d build
  cd build

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
  make lang
}

package() {
  cd "${srcdir}/${_gitname}/build"

  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et:
