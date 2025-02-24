# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-dissect.util
_name=dissect_util
pkgver=3.19
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
sha256sums=('c942ea396eb01862d1f3bb2f750fcafbff08aeaf603b57c82b450270524f7c06')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
