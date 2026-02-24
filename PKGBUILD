# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-dissect.util
_name=dissect_util
pkgver=3.24
pkgrel=1
epoch=
pkgdesc="A Dissect module implementing various utility functions for the other Dissect modules"
arch=('any')
url="https://pypi.org/project/dissect.util"
license=(Apache-2.0)
groups=()
provides=(${_name} ${pkgname} dissect.util)
conflicts=(${_name} ${pkgname} dissect.util)
depends=(
    python
    python-lz4
    #AUR
    python-lzo
)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools
    python-setuptools-scm
)
checkdepends=()
options=()
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('56ae08decaf4112d7fa9b9a575e5203b6dc85d9efe9a56d74ba34e0c2878c575')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
