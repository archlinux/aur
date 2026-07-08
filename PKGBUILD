# Maintainer: enihcam <enihcam@archlinux.us>

pkgname=python-nest-asyncio2
pkgver=1.7.2
pkgrel=1
pkgdesc="Patch asyncio to allow nested event loops (Python 3.14+ fork)"
arch=('any')
url="https://github.com/Chaoses-Ib/nest-asyncio2"
license=('BSD')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm' )
depends=()

source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/n/nest-asyncio2/nest_asyncio2-1.7.2.tar.gz")
sha256sums=('1921d70b92cc4612c374928d081552efb59b83d91b2b789d935c665fa01729a8')

prepare() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    sed -i "s/use_scm_version={.*}/version=${pkgver}/" pyproject.toml || true
}

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
