# Contributor: Daniel Meszaros <easimer@gmail.com>
# Contributor: Bastien Dejean <nihilhill@gmail.com>
# Contributor: solsTice d'Hiver <solstice.dhiver@gmail.com>
# Contributor: Prurigro

pkgname=xar
pkgver=1.6.1
pkgrel=4
pkgdesc='eXtensible ARchive format'
arch=('i686' 'x86_64')
url='http://mackyle.github.io/xar/'
license=('custom:BSD')
depends=('libxml2' 'openssl-1.0' 'bzip2')
options=('!libtool')
source=('https://github.com/downloads/mackyle/xar/xar-1.6.1.tar.gz' 'xar-ext2-bug-workaround.patch')
md5sums=('a624535d6a1e8fdf420b36a6b334047b' '4d4c52b9fbd8861e1322257a1b365f01')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    patch -p1 < "$srcdir/xar-ext2-bug-workaround.patch"
    ./autogen.sh --prefix=/usr --mandir=/usr/share/man CFLAGS="-I/usr/include/openssl-1.0" LDFLAGS="-L/usr/lib/openssl-1.0"
    make
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
