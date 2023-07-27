pkgbase='python-hankel'
pkgname=('python-hankel')
_module='hankel'
pkgver='1.2.1'
pkgrel=1
pkgdesc="Hankel Transformations using method of Ogata 2005"
url="https://github.com/steven-murray/hankel"
depends=('python')
makedepends=('python-build' 'python-installer')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz" "setupfix.patch")
sha256sums=('b74f8b776967976c1a9902d4780d33e4907509cfcdd17feec75b4416fba84039'
            '86f480e200f0e587495384fd21e887ce474b95f98f87888e317347a26bc009d8')

prepare() {
    cd "${srcdir}/${_module}-${pkgver}"
    patch -p1 < "../setupfix.patch"
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
