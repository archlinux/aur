pkgname=srecord
pkgver=1.64
pkgrel=1
pkgdesc="The SRecord package is a collection of powerful tools for manipulating EPROM load files."
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('boost' 'ghostscript')
url="http://srecord.sourceforge.net"
source=("${url}/${pkgname}-${pkgver}.tar.gz")
# broken makefile has race conditions, remove "-j"
options=('!makeflags')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr || return 1
    make || return 1
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install || return 1
}
md5sums=('4de4a7497472d7972645c2af91313769')
