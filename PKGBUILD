# Maintainer: Jay Tsung <int8@foxmail.com>
pkgname=libradtran
_pkgname=libRadtran
pkgver=2.0.3
pkgrel=1
pkgdesc="library for radiative transfer"
arch=('x86_64')
url="http://www.libradtran.org"
license=('GPL')
depends=('netcdf')
makedepends=('python2'
             'gcc-fortran')
optdepends=('perl: run the tests and some of the tools')
source=("http://www.libradtran.org/download/history/$_pkgname-$pkgver.tar.gz"
        "$_pkgname-$pkgver.patch")
sha256sums=('4750882030042403b815684370172c33643b05e3db7e84072355b52243b37663'
            '42cbcef0ce41975e31ca767ce6a51ef70587e0d0b7a1de931aac38be4fa83dd8')

prepare() {
	cd "$_pkgname-$pkgver"
	patch -p1 -i "$srcdir/../$_pkgname-$pkgver.patch"
}

build() {
	cd "$_pkgname-$pkgver"
	export CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fno-plt -fexceptions \
        -Wp,-D_FORTIFY_SOURCE=2 \
        -fstack-clash-protection -fcf-protection"
	./configure --prefix=/usr
	make
}

package() {
	cd "$_pkgname-$pkgver"
	make prefix="$pkgdir/usr/" install
}
