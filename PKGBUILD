# Original author: Manuel Schoenlaub <manuel.schoenlaub@gmail.com>
# Contributor:     Ã‰milien Tlapale <emilien@tlapale.com>
# Contributor:     Xīcò <xico@atelo.org>
# Maintainer:      mrohnstock <linksoft [at] gmx [dot] de>
# Maintainer:      Tyler Brock <tyler@mongodb.com>

pkgname='mongo-c-driver'
pkgver='1.1.8'
pkgrel='1'

pkgdesc='The official MongoDB client library written in C.'
arch=('i686' 'x86_64')
url='http://www.mongodb.org/display/DOCS/C+Language+Center'
license=('Apache')
depends=('libbson>=1.0.0')
makedepends=(perl)
optdepends=(
    'xmlto: documentation'
    'asciidoc: documentation'
    'python: documentation'
    'libsasl>=2.1.6: sasl support'
    'openssl: ssl support'
)
source=("https://github.com/mongodb/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('b0b74700e2d9f2b53f94191abde3565ded8eda464d26fdd03982bfb9ec8ac93bc7550e0775f1ecf6cc50e251f063ad5af04f4d1b603e6530e27be14cc0ca67b8')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix='/usr' CFLAGS='-pthread' LDFLAGS='-lpthread' --enable-man-pages=no --enable-examples=no --enable-tests=no
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
