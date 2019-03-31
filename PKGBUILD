pkgname=srecord
pkgver=1.64
pkgrel=2
pkgdesc="The SRecord package is a collection of powerful tools for manipulating EPROM load files."
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('boost' 'ghostscript')
url="http://srecord.sourceforge.net"
source=("${url}/${pkgname}-${pkgver}.tar.gz"
        'coe.patch')
# broken makefile has race conditions, remove "-j"
options=('!makeflags')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 < "$srcdir/coe.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr || return 1
    make || return 1
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install || return 1
}
md5sums=('4de4a7497472d7972645c2af91313769'
         '7bd7d4451a683d4832a0ddb2b160756e')
