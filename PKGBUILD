# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-gs-usb
_name=${pkgname#python-}
pkgver=0.3.1
pkgrel=2
epoch=
pkgdesc="Python Windows/Linux/Mac CAN driver based on usbfs or WinUSB WCID for Geschwister Schneider USB/CAN devices and candleLight USB CAN interfaces."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-pyusb
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
sha256sums=('a8a76285fda29b45a5a633cfe232a08058f642441b3d030877dc28ef6e0b7807')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    #     install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
