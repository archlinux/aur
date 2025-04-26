# Contributor: pumpkincheshire <sollyonzou@gmail.com>

pkgname=python-anyconfig-bson-backend
_name=${pkgname#python-}
pkgver=0.2.0
pkgrel=1
pkgdesc='Backend module for python-anyconfig to load and dump BSON data'
url='https://github.com/ssato/python-anyconfig-bson-backend'
arch=('any')
license=('MIT')
depends=('python-anyconfig' 'python-pymongo')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('dfe3dee37c07c610bdd652f31be86bc09072aa1df6c9d04705042c7c0c27a7fd')

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
