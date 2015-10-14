# Original author: Manuel Schoenlaub <manuel.schoenlaub@gmail.com>
# Contributor:     Ã‰milien Tlapale <emilien@tlapale.com>
# Contributor:     Xīcò <xico@atelo.org>
# Maintainer:      mrohnstock <linksoft [at] gmx [dot] de>
# Maintainer:      Tyler Brock <tyler@mongodb.com>

pkgname='mongo-c-driver'
pkgver='1.2.0'
pkgrel='1'

pkgdesc='The official MongoDB client library written in C.'
arch=('i686' 'x86_64')
url='http://www.mongodb.org/display/DOCS/C+Language+Center'
license=('Apache')
depends=('libbson>=1.2.0')
makedepends=(perl)
optdepends=(
    'xmlto: documentation'
    'asciidoc: documentation'
    'python: documentation'
    'libsasl>=2.1.6: sasl support'
    'openssl: ssl support'
)
source=("https://github.com/mongodb/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('145f9cf65963a88eb06cd2d534b29fd816ef107db3aaaf066050faa12a7db305656d88f526372391de28bb62892d6c52402652314b859ba9a524fac076be0584')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix='/usr' CFLAGS='-pthread' LDFLAGS='-lpthread' --enable-man-pages=yes --with-libbson=system --enable-examples=no --enable-tests=no
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
