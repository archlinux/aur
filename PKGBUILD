# Maintainer: Brent Carmer <bcarmer@gmail.com>
pkgname=clt13-git
_pkgname=clt13

pkgver=0.1.0.r24.g8aae4d0
pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

pkgrel=2
pkgdesc="Implementation of the CLT13 multilinear map over integers."
url="https://github.com/spaceships/clt13"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('gmp' 'libaesrand')
makedepends=('git' 'gcc' 'make')
conflicts=()
replaces=()
backup=()
conflicts=('clt13')
provides=('clt13')
md5sums=('SKIP')

source=("git://github.com/spaceships/clt13.git")

build() {
    cd $srcdir/${_pkgname}
    mkdir -p build/autoconf
    autoreconf -i
    ./configure --prefix=/usr
    make
}

package() {
  cd $srcdir/$_pkgname 
  make DESTDIR=${pkgdir} install
  libtool --finish /usr/lib
}
