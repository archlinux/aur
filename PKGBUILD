# Contributor: pumpkincheshire <sollyonzou@gmail.com>

pkgname=python-anyconfig-json5-backend
_name=${pkgname#python-}
pkgver=0.2.1
pkgrel=1
pkgdesc="Backend module for python-anyconfig to load and dump JSON5 files"
url='https://github.com/ssato/python-anyconfig-json5-backend'
arch=('any')
license=('MIT')
depends=('python-anyconfig')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('0183135e937843acde2d8bacf764c49e025505f545921bd6f63ffe7968d95bc4')

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
