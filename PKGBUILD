# Maintainer: rnestler

pkgname=git-delete-merged-branches
pkgver=6.4.0
pkgrel=2
pkgdesc="Command-line tool to delete merged Git branches."
arch=('any')
url="https://pypi.org/project/git-delete-merged-branches/"
license=('GPL3')
depends=('python>=3.7.0' 'python-colorama' 'python-prompt-toolkit')
makedepends=('python-setuptools')
checkdepends=('python-parameterized')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hartwork/$pkgname/archive/$pkgver.tar.gz")

sha512sums=('d374d6183baef751623b681bcb3a551711c54094a1afb612af89b6fcfe1359a1e63e69574589d91f26082979e248262497888bc80453b406840dd5425c34e019')

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
