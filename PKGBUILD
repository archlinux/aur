# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-ftd2xx
_name=${pkgname#python-}
pkgver=1.3.6
pkgrel=1
epoch=
pkgdesc="Python interface to ftd2xx.dll from FTDI using ctypes based on d2xx by Pablo Bleyer"
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-pytest
    #AUR

)
makedepends=(
    python-hatchling
    python-hatch-vcs
    python-build
    python-installer
    python-wheel
    python-setuptools
)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('e5af93ddeb672e7b653c480ac30d9d4a3c769dc088778d97bcbab59441ae808d')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
