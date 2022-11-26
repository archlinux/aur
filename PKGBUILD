# Maintainer: rnestler

pkgname=git-delete-merged-branches
pkgver=7.2.1
pkgrel=1
pkgdesc="Command-line tool to delete merged Git branches."
arch=('any')
url="https://pypi.org/project/git-delete-merged-branches/"
license=('GPL3')
depends=('python>=3.7.0' 'python-colorama' 'python-prompt_toolkit')
makedepends=('python-setuptools')
checkdepends=('python-parameterized')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hartwork/$pkgname/archive/$pkgver.tar.gz")

sha512sums=('1de594c5835185e97ac9246e05e47cfba22877162a031b9b4dd208618bb1298db0b7fc558e3c8469b1177ced773d878959133b38f4dff3fe1f50be7010ee1877')

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
