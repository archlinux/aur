# Maintainer: Sick Codes <info at sick dot codes>
# Contributor: Daniel Meszaros <easimer@gmail.com>
# Contributor: Bastien Dejean <nihilhill@gmail.com>
# Contributor: solsTice d'Hiver <solstice.dhiver@gmail.com>
# Contributor: Prurigro

pkgname=xar
pkgver=1.6.1
pkgrel=5
pkgdesc='eXtensible ARchive format'
arch=('i686' 'x86_64')
url='http://mackyle.github.io/xar/'
_fork='https://github.com/tpoechtrager/xar'
license=('custom:BSD')
depends=('libxml2' 'openssl-1.0' 'bzip2')
options=('!libtool')
source=('git+https://github.com/tpoechtrager/xar.git')
md5sums=('SKIP')

build() {
    cd "$srcdir/${pkgname}/xar"
    ./autogen.sh \
        --prefix=/usr \
        --mandir=/usr/share/man \
        CFLAGS="-I/usr/include/openssl-1.0" \
        LDFLAGS="-L/usr/lib/openssl-1.0"
    make
}

package() {
    cd "$srcdir/${pkgname}/xar"
    make DESTDIR="$pkgdir" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
