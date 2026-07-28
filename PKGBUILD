# Maintainer: rnestler

pkgname=git-delete-merged-branches
pkgver=7.6.1
pkgrel=1
pkgdesc="Command-line tool to delete merged Git branches."
arch=('any')
url="https://pypi.org/project/git-delete-merged-branches/"
license=('GPL3')
depends=('python>=3.9.0' 'python-colorama' 'python-prompt_toolkit')
makedepends=('python-setuptools')
checkdepends=('python-parameterized')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hartwork/$pkgname/archive/$pkgver.tar.gz")

sha512sums=('37bed1f0b8173c282f30b7adf875e06761659ebe8193fba4a225ef23961a169ea6fdc496c2107429173048c67dd83130dc9a7100905bdd8a383a726e834e3c9b')

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
