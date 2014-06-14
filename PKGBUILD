# Maintainer: Ian D. Scott <ian@perebruin.com>
# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
pkgname=dantalian
pkgver=0.5
pkgrel=1
pkgdesc="Transparent tag-based file organization system."
arch=('any')
url="http://darkfeline.github.io/dantalian/"
license=('mit')
depends=('python')
optdepends=('fuse: additional features')
makedepends=('python-sphinx')
source=("https://github.com/darkfeline/dantalian/archive/${pkgver}.tar.gz")
sha256sums=('9a35f45d2f0b14e723b751edb879f0c407e6a2a3c60769839d19b49e5e9548d0')

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
    install -Dm644 doc/_build/man/dantalian.1 "$pkgdir/usr/share/man/man1/dantalian.1"

    # html documentation
    install -dm755 "$pkgdir/usr/share/doc/dantalian"
    cp -R doc/_build/singlehtml/* "$pkgdir/usr/share/doc/dantalian"
}
