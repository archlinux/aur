# Contributor: pumpkincheshire <sollyonzou@gmail.com>

pkgname=python-anyconfig-ion-backend
_name=${pkgname#python-}
pkgver=0.2.0
pkgrel=1
pkgdesc='Backend module for python-anyconfig to load and dump Amazon Ion data'
url='https://github.com/ssato/python-anyconfig-ion-backend'
arch=('any')
license=('MIT')
depends=('python-anyconfig' 'python-amazon.ion')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('e3cc5280602d8b4d43021d096560d30612fc0ab46898e79298395dcc7e6ee7c0')

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
