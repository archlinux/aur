# Original author: Manuel Schoenlaub <manuel.schoenlaub@gmail.com>
# Contributor:     Ã‰milien Tlapale <emilien@tlapale.com>
# Contributor:     Xīcò <xico@atelo.org>
# Maintainer:      mrohnstock <linksoft [at] gmx [dot] de>
# Maintainer:      Tyler Brock <tyler@mongodb.com>

pkgname='mongo-c-driver'
pkgver='1.2.1'
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
sha512sums=('08af2266bac3c9ae30cc4f834e8cf5bb0d9a2bf5094c03d4825ca2d367c987d9fa1504bece0fcbfbb42d20841efb2ad1babff87fbe01053039973ea693905728')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix='/usr' CFLAGS='-pthread' LDFLAGS='-lpthread' --enable-man-pages=yes --with-libbson=system --enable-examples=no --enable-tests=no
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
