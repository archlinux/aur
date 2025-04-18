# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-obd
_name=${pkgname#python-}
pkgver=0.7.3
pkgrel=1
epoch=
pkgdesc="Serial module for handling live sensor data from a vehicle's OBD-II port."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(GPL-2.0-only)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-can
    python-pint
    python-pyserial
)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools
)
options=('!strip' '!debug')
_name=${_name//-/_}
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('27b8f043376ca700edb98bf5216e2912295ecde0e735b260999f2d9ddf342522')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
