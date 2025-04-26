# Contributor: PumpkinCheshire <me at pumpkincheshire dot top>

pkgname=python-anyconfig-fortios-backend
_name=${pkgname#python-}
pkgver=0.3.0
pkgrel=1
pkgdesc="Backend module for python-anyconfig to load fortios' show configuration outputs"
url='https://github.com/ssato/python-anyconfig-fortios-backend'
arch=('any')
license=('MIT')
depends=('python-anyconfig')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('ab24a3171aed53037c58d034806e6d7244293a35088072a1c8ac435dc8af8bd5f9f262a9b76f3a2b6ff232be4ce506565c5efe4a7b9b47a0d9b97f684d9f01e5')

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
