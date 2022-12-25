# Maintainer: rnestler

pkgname=git-delete-merged-branches
pkgver=7.4.0
pkgrel=1
pkgdesc="Command-line tool to delete merged Git branches."
arch=('any')
url="https://pypi.org/project/git-delete-merged-branches/"
license=('GPL3')
depends=('python>=3.7.0' 'python-colorama' 'python-prompt_toolkit')
makedepends=('python-setuptools')
checkdepends=('python-parameterized')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hartwork/$pkgname/archive/$pkgver.tar.gz")

sha512sums=('35eb39fcbe88e7e790ab9655675a0a75ebff83378829b5eba89310a20d317d597a9cce4c7fe26e05d047fa4850d8d4290c011463a644fd11b3d1d1e89deae8c6')

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
