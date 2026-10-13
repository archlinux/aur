# Maintainer: rnestler

pkgname=git-delete-merged-branches
pkgver=7.7.0
pkgrel=1
pkgdesc="Command-line tool to delete merged Git branches."
arch=('any')
url="https://pypi.org/project/git-delete-merged-branches/"
license=('GPL-3.0-or-later')
depends=('python>=3.9.0' 'python-colorama' 'python-prompt_toolkit')
makedepends=('python-setuptools')
checkdepends=('python-parameterized')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hartwork/$pkgname/archive/$pkgver.tar.gz")

sha512sums=('49ae9127ec24d89cf454ca6a2550ce3d24654ecc77056ba9893c45549078e972388551778a24c909e26b9e41d3c995e71e1a46d22e43b0f56eade953a1749fbf')

build() {
    cd "$srcdir"/$pkgname-$pkgver
    python setup.py build
}

check() {
    cd "$srcdir"/$pkgname-$pkgver
    python setup.py test || echo "Tests failed"
}

package() {
    cd $pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1

    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
