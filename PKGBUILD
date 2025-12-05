# Maintainer: Storm Dragon <storm_dragon@stormux.org>
pkgname=python-miniirc
_name=miniirc
pkgver=1.10.0
pkgrel=1
pkgdesc="A straightforward IRC client library for Python"
arch=('any')
url="https://github.com/luk3yx/miniirc"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('python-certifi: for SSL certificate verification')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9811ed325924359be622563510842715012f7c7b23430545cfdeb7ff80e2eaf8')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install license if available
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
