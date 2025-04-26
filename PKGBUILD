# Contributor: pumpkincheshire <sollyonzou@gmail.com>

pkgname=python-anyconfig-cbor2-backend
_name=${pkgname#python-}
pkgver=0.2.0
pkgrel=1
pkgdesc='Backend module for python-anyconfig to load and dump CBOR data'
url='https://github.com/ssato/python-anyconfig-cbor2-backend'
arch=('any')
license=('MIT')
depends=('python-anyconfig' 'python-cbor2')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('58dfcceae2df3bd5c3c9a97d88b6eb603bfe1aeb3b7b8ad8490a8dce75130d72')

prepare() {
    cd "$_name-$pkgver"
    sed -i -e '1,3d' -e '/License ::/d' setup.cfg
}

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: set ts=4 sw=4 et:
