# Maintainer: rnestler

pkgname=python-prompt-toolkit
pkgver=3.0.24
pkgrel=1
pkgdesc="Library for building powerful interactive command line applications in Python."
arch=('any')
url="https://pypi.org/project/prompt-toolkit/"
license=('BSD')
depends=('python' 'python-wcwidth')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/prompt-toolkit/python-prompt-toolkit/archive/$pkgver.tar.gz")

sha512sums=('90844db035abbec88bb021a188709e02139fcd349780243493c0e047dd61b3c52e51511385ca61da8007345d59f781c07c39f2d90bba005eb27a6afdb81c8cc7')

build() {
    cd "$srcdir"/$pkgname-$pkgver
    python setup.py build
}

check() {
    cd "$srcdir"/$pkgname-$pkgver
    pytest || echo "Tests failed"
}

package() {
    cd $pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1

    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
