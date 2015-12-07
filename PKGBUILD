# Original author: Manuel Schoenlaub <manuel.schoenlaub@gmail.com>
# Contributor:     Ã‰milien Tlapale <emilien@tlapale.com>
# Contributor:     Xīcò <xico@atelo.org>
# Maintainer:      mrohnstock <linksoft [at] gmx [dot] de>
# Maintainer:      Tyler Brock <tyler@mongodb.com>

pkgname='mongo-c-driver'
pkgver='1.2.3'
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
sha512sums=('3eb6f9b72b5e72306405c2d1118082e141509aec1477dac0a1ec75879d45b81abe4a61b999e5c0747f1dd719d7b3a05907fea9e1865cf9d557c6c30391eae569')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./autogen.sh --prefix='/usr' CFLAGS='-pthread' LDFLAGS='-lpthread' --enable-man-pages=yes --with-libbson=system --enable-examples=no --enable-tests=no
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
