# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-dissect.util
_name=dissect_util
pkgver=3.21
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
sha256sums=('fbf6572ed0700e086d9c42bd2cf0faccbe66aea8c4b4c4664a0801c2a09520b0')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
