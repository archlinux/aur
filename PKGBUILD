# Maintainer: Taevas <code@taevas.xyz>

pkgname=('python-tetra')
_name=${pkgname#python-}
pkgver='0.6.10'
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
sha256sums=('6a00b25cff4eb1aa10ea4363ab9348c3391ef96f836f552d65253702b3760b63')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
