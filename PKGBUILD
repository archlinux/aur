# Maintainer: Wouter de Vries <wouter@wbdv.nl>
# Contributor: Wouter de Vries <wouter@wbdv.nl>
pkgname=bgpscanner
pkgver=1.0
_pkgver=$pkgver-1
pkgrel=1
pkgdesc="C library designed to efficiently parse BGP routing information contained in RIB snapshots and UPDATE collection files provided by route collecting projects"
arch=('x86_64')
url="https://isolario.it/web_content/php/site_content/tools.php"
depends=('zlib' 'xz' 'bzip2' 'lz4')
license=('BSD')
source=("https://isolario.it/tools/bgpscanner-1.0-1_20190320.tar.gz" "license")
md5sums=('1a8386ebc66c9f8120e452c241c813da'
         '5f7695a319c1dee44a4837cc1c05b092')

build() {
    cd "$pkgname-$_pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$_pkgver"

    # Install bgpscanner binary
    make DESTDIR="$pkgdir" install

    # Install license
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    install -m 644 ../license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
