# Maintainer: Bet4 <0xbet4@gmail.com>

pkgname=libipt-git
pkgver=814.892e12c
pkgrel=1
pkgdesc='An Intel(R) Processor Trace decoder library'
arch=(i686  x86_64)
url='https://github.com/intel/libipt'
license=('BSD')
makedepends=(git cmake)
source=("${pkgname}::git+${url}.git")
md5sums=(SKIP)

pkgver() {
  cd ${pkgname}
  printf "%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "${pkgname}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}
