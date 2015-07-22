# Original author: Manuel Schoenlaub <manuel.schoenlaub@gmail.com>
# Contributor:     Ã‰milien Tlapale <emilien@tlapale.com>
# Contributor:     Xīcò <xico@atelo.org>
# Maintainer:      mrohnstock <linksoft [at] gmx [dot] de>
# Maintainer:      Tyler Brock <tyler@mongodb.com>

pkgname='mongo-c-driver'
pkgver='1.1.10'
pkgrel='1'

pkgdesc='The official MongoDB client library written in C.'
arch=('i686' 'x86_64')
url='http://www.mongodb.org/display/DOCS/C+Language+Center'
license=('Apache')
depends=('libbson>=1.1.0')
makedepends=(perl)
optdepends=(
    'xmlto: documentation'
    'asciidoc: documentation'
    'python: documentation'
    'libsasl>=2.1.6: sasl support'
    'openssl: ssl support'
)
source=("https://github.com/mongodb/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('10ebd1bddc0c713c0934679974fb1ed29eda1bf8e2ebbe2a1ebbcba219574092c34c4b352231ec65ffe3e350d8d701ef85debaaa9f9c10e6ab36fc3fa29f69df')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix='/usr' CFLAGS='-pthread' LDFLAGS='-lpthread' --enable-man-pages=no --enable-examples=no --enable-tests=no
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
