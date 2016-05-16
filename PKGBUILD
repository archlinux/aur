# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-oursql
pkgver=0.9.3.2
pkgrel=1
pkgdesc="Set of MySQL bindings for python with real parameterization and real server-side cursors."
arch=("i686" "x86_64")
url="https://launchpad.net/oursql"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools' 'libperconaserverclient')
source=("https://files.pythonhosted.org/packages/source/o/oursql/oursql-$pkgver.tar.gz")
sha256sums=('8031855fc77dff9c6a02294f1156ef35dfab2c7fbff7cd791298eb4d0b106095')

build() {
    cd "$srcdir/oursql-$pkgver"
    CFLAGS="$CFLAGS -I/usr/include/perconaserver/" python2 setup.py build
}

package() {
    cd "$srcdir/oursql-$pkgver"
    python2 setup.py install --skip-build -O1 --root="$pkgdir"
    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

