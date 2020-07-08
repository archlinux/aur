# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=crate
pkgname=python-$_pipname
pkgver=0.24.0
pkgrel=1
pkgdesc="A Python client library for CrateDB"
arch=('any')
url="https://github.com/crate/crate-python"
license=('Apache')
depends=('python' 'python-urllib3')
makedepends=('python-setuptools')
optdepends=('python-sqlalchemy')
source=("https://files.pythonhosted.org/packages/source/${_pipname::1}/$_pipname/$_pipname-$pkgver.tar.gz")
sha256sums=('5e416ffeee74b839e297d60d930202c11fefe8855f4dae0a0a78628f434e1809')

build() {
    cd "$_pipname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pipname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" {CONTRIBUTING,DEVELOP,README}.rst
}
