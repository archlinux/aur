# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=crate
pkgname=python-$_pipname
pkgver=0.26.0
pkgrel=1
pkgdesc="A Python client library for CrateDB"
arch=('any')
url="https://github.com/crate/crate-python"
license=('Apache')
depends=('python' 'python-urllib3')
makedepends=('python-setuptools')
optdepends=('python-sqlalchemy')
source=("https://files.pythonhosted.org/packages/source/${_pipname::1}/$_pipname/$_pipname-$pkgver.tar.gz")
sha256sums=('6f650c2efe250b89bf35f8fe3211eb37ebc8d76f7a9c09bd73db3076708fa2fc')

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
