# Maintainer: Ian D. Scott <ian@perebruin.com>
# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
pkgname=dantalian
pkgver=0.6
pkgrel=2
pkgdesc="Transparent tag-based file organization system."
arch=('any')
url="http://darkfeline.github.io/dantalian/"
license=('mit')
depends=('python')
optdepends=('fuse: additional features')
makedepends=('python-sphinx')
source=("https://github.com/darkfeline/dantalian/archive/${pkgver}.tar.gz")
sha256sums=('8769f91a5bb41a441ba543313924d1790e7f9ab34c73c1d82c5746d85f717e98')

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
