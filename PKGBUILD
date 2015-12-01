# Original author: Manuel Schoenlaub <manuel.schoenlaub@gmail.com>
# Contributor:     Ã‰milien Tlapale <emilien@tlapale.com>
# Contributor:     Xīcò <xico@atelo.org>
# Maintainer:      mrohnstock <linksoft [at] gmx [dot] de>
# Maintainer:      Tyler Brock <tyler@mongodb.com>

pkgname='mongo-c-driver'
pkgver='1.2.2'
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
source=("https://github.com/mongodb/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('236870dc3f3019ad315b46cca496ba90728e6c92f730553d390c84bbd09318887961712be1862c4e3591173db621dc83467cedcf981cfea7dcb6efb669500849')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./autogen.sh --prefix='/usr' CFLAGS='-pthread' LDFLAGS='-lpthread' --enable-man-pages=yes --with-libbson=system --enable-examples=no --enable-tests=no
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
