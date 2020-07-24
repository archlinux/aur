# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

pkgname=python-redis-lock
pkgver=3.6.0
pkgrel=1
pkgdesc="Lock context manager implemented via redis SET NX EX and BLPOP"
url="https://pypi.org/project/python-redis-lock/"
depends=('python' 'python-redis')
makedepends=('python-setuptools')
optdepends=('python-django-redis')
checkdepends=('python-pytest' 'python-process-tests')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")

sha256sums=('6c79b87f2fefcf47bbcebea56056d324e9d7971c9b98123b79590e08cbb0a8f7')

check() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    PYTHONUNBUFFERED=yes DJANGO_SETTINGS_MODULE=test_project.settings PYTHONPATH=./build/lib pytest
}

build() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
