# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-kinet2pcb
_name=${pkgname#python-}
pkgver=1.1.4
pkgrel=1
epoch=
pkgdesc="Convert KiCad netlist into a PCBNEW .kicad_pcb file."
arch=('any')
url="https://pypi.org/project/kinet2pcb"
license=(MIT)
groups=()
provides=(${_name})
conflicts=(${_name})
depends=(
    kicad
    python
    python-kinparse
    python-hierplace)
makedepends=(python-build
    python-installer
    python-wheel
    python-setuptools
    python-pytest-runner)
options=('!emptydirs' '!strip')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('9374a09ba58f64895b5e47c972b20315d624e06eec48925df26a308e2746f661')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
