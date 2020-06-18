# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

pkgname=python-redis-lock
pkgver=3.5.0
pkgrel=1
pkgdesc="Lock context manager implemented via redis SET NX EX and BLPOP"
url="https://pypi.org/project/charamel/"
depends=('python' 'python-redis')
makedepends=('python-setuptools')
optdepends=('python-django-redis')
checkdepends=('python-pytest' 'python-process-tests')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")

sha256sums=('06f28f63bf4ea3d739ff5c472e76563e24aa5c887002a85cbdb7a5b13aa05897')

check() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    PYTHONUNBUFFERED=yes DJANGO_SETTINGS_MODULE=test_project.settings PYTHONPATH=. pytest
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
