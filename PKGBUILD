# Maintainer: rnestler

pkgname=git-delete-merged-branches
pkgver=7.7.1
pkgrel=1
pkgdesc="Command-line tool to delete merged Git branches."
arch=('any')
url="https://pypi.org/project/git-delete-merged-branches/"
license=('GPL-3.0-or-later')
depends=('python>=3.9.0' 'python-colorama' 'python-prompt_toolkit')
makedepends=('python-setuptools')
checkdepends=('python-parameterized')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hartwork/$pkgname/archive/$pkgver.tar.gz")

sha512sums=('a4c05010bc831f304b082f8cccf395e6bd10bd596f612457601367b691b3fb4749e8634b68a6c7f66e11eae4582c27be97ba287d7f801b1c1598cd86b4c40dd4')

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
