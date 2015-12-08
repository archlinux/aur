# Original author: Manuel Schoenlaub <manuel.schoenlaub@gmail.com>
# Contributor:     Ã‰milien Tlapale <emilien@tlapale.com>
# Contributor:     Xīcò <xico@atelo.org>
# Maintainer:      mrohnstock <linksoft [at] gmx [dot] de>
# Maintainer:      Tyler Brock <tyler@mongodb.com>

pkgname='mongo-c-driver'
pkgver='1.3.0'
pkgrel='1'

pkgdesc='The official MongoDB client library written in C.'
arch=('i686' 'x86_64')
url='http://www.mongodb.org/display/DOCS/C+Language+Center'
license=('Apache')
depends=('libbson>=1.3.0')
makedepends=(perl)
optdepends=(
    'xmlto: documentation'
    'asciidoc: documentation'
    'python: documentation'
    'libsasl>=2.1.6: sasl support'
    'openssl: ssl support'
)
source=("https://github.com/mongodb/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('5cc473480e7b49cad6a4934d0ebc50a1c17f16079f6b4d3d562e522deaa93dcad98d60951aa624305686b4b4ca4eeae357a1d988e66bd346cdd336852d3fcde1')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./autogen.sh --prefix='/usr' CFLAGS='-pthread' LDFLAGS='-lpthread' --with-libbson=system --enable-examples=no --enable-tests=no
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
