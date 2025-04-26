# Contributor: pumpkincheshire <sollyonzou@gmail.com>

pkgname=python-anyconfig-configobj-backend
_name=${pkgname#python-}
pkgver=0.3.0
pkgrel=1
pkgdesc='Backend module for python-anyconfig to load and dump ConfigObj data'
url='https://github.com/ssato/python-anyconfig-configobj-backend'
arch=('any')
license=('MIT')
depends=('python-anyconfig' 'python-configobj')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('15bbad830cee6cacfe8236aba21bc39fbe96a140f410d4d8d5b06d65e2c0f8ae')

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
