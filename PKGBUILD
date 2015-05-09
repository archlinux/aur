# Maintainer: Ian D. Scott <ian@perebruin.com>
# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
pkgname=dantalian
pkgver=1.0
pkgrel=1
pkgdesc="Transparent tag-based file organization system."
arch=('any')
url="http://darkfeline.github.io/dantalian/"
license=('GPL')
depends=('python')
optdepends=('fuse: additional features')
makedepends=('python-sphinx')
source=("https://github.com/darkfeline/dantalian/archive/v${pkgver}.tar.gz")
sha256sums=('263f3834a6fa89e3fe148b5cd133243dfdcd211801b62f68e538cf0138b49bf1')

build() {
    cd "$srcdir/$pkgname-$pkgver/doc"
    make man singlehtml
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/"

    # license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/dantalian/LICENSE"

    # man page
    mkdir -p "$pkgdir/usr/share/man/man1/"
    install -Dm644 doc/_build/man/* "$pkgdir/usr/share/man/man1/"

    # html documentation
    install -dm755 "$pkgdir/usr/share/doc/dantalian"
    cp -R doc/_build/singlehtml/* "$pkgdir/usr/share/doc/dantalian"
}
