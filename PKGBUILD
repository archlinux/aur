# Maintainer: Pascal Bos <bosp@nikhef.nl>
# Contributor: Felix Salfelder <felix@salfelder.org>

pkgname=qucsator-git
pkgver=0.0.20.r4.g22126bb
pkgrel=1
pkgdesc="An integrated circuit simulator"
arch=('x86_64')
url="http://qucs.sourceforge.net"
license=('GPL')
depends=('gcc-libs' 'adms')
makedepends=('git' 'gperf')
conflicts=('qucsator')
provides=("qucsator=${pkgver}")
source=('git+https://github.com/Qucs/qucsator.git#branch=develop')
md5sums=('SKIP')

build() {
    cd ./qucsator
    ./bootstrap
    ./configure --prefix=/usr
    make -j1
}

package() {
    cd ./qucsator
    make DESTDIR="$pkgdir" install
}

pkgver() {
    cd "$srcdir/qucsator"
    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
} 
