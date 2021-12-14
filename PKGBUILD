# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

pkgname=python-redis-lock
pkgver=3.7.0
pkgrel=2
pkgdesc="Lock context manager implemented via redis SET NX EX and BLPOP"
url="https://pypi.org/project/python-redis-lock/"
depends=('python' 'python-redis')
makedepends=('python-setuptools')
optdepends=('python-django-redis')
checkdepends=('python-pytest' 'python-process-tests')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")

sha256sums=('4265a476e39d476a8acf5c2766485c44c75f3a1bd6cf73bb195f3079153b8374')

check() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    PYTHONUNBUFFERED=yes DJANGO_SETTINGS_MODULE=test_project.settings PYTHONPATH=./build/lib pytest -k 'not test_no_overlap2'
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
