# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=sdcv-git
_pkgname=sdcv
pkgver=0.5.3.r0.ge73388c
pkgrel=1
pkgdesc="StarDict Console Version - Git version"
arch=('x86_64')
url="https://github.com/Dushistov/sdcv"
license=('GPL')
depends=('glib2' 'readline' 'zlib')
makedepends=('cmake' 'git')
source=("git+${url}.git")
md5sums=('SKIP')
provides=('sdcv')
conflicts=('sdcv')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  git describe --long | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "${srcdir}/${_pkgname}"

  install -d build
  cd build

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
  make lang
}

package() {
  cd "${srcdir}/${_pkgname}/build"

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
