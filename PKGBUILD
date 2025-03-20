# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-udsoncan
_name=${pkgname#python-}
pkgver=1.24.0
pkgrel=1
epoch=
pkgdesc="Implementation of the Unified Diagnostic Service (UDS) protocol (ISO-14229) used in the automotive industry."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-can
    # AUR
    python-aioisotp
    python-can-isotp
)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools
)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('a111fc2a0e5afb66102ac1b81475ff229c4c9aed719d4240f60e9221318f6f63')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
