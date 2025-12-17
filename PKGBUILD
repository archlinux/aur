# Maintainer: Taevas <code@taevas.xyz>

pkgname=('python-tetra')
_name=${pkgname#python-}
pkgver='0.5.0'
pkgrel=1
pkgdesc="Full stack component framework for Django using Alpine.js"
license=('MIT')
arch=('any')
url="https://tetraframework.com/"
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
depends=('python' 'python-cryptography' 'python-django' 'python-dateutil' 'python-sourcetypes')
optdepends=('python-django-channels: reactive components'
            'python-daphne: reactive components')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('e59b02387341b62b85c28d6a3c0535c15e8aed5d5f305fb6962a7377e290c407')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
