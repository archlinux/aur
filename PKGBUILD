#Maintainer: Ian Beringer <ian@ianberinger.com>

pkgname=libqb-git
_pkgname=libqb
pkgver=1.0.2.r0.g608de6d
pkgrel=1
pkgdesc='Library with the primary purpose of providing high performance client server reusable features'
arch=("i686" "x86_64")
depends=("glibc")
makedepends=("git" "doxygen" "splint")
license=('LGPL2.1')
url=https://github.com/ClusterLabs/$_pkgname
source=("${_pkgname}::git+https://github.com/ClusterLabs/libqb.git")
sha256sums=('SKIP')
provides=('libqb')
conflicts=('libqb')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr --sbindir=/usr/bin --libdir=/usr/lib
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir/" install
}
