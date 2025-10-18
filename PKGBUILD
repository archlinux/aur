# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-guardpost
_name=${pkgname#python-}
pkgver=1.0.4
pkgrel=1
epoch=
pkgdesc="Framework to handle authentication and authorization."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-cryptography
    python-pyjwt
    #AUR
    python-rodi
)
makedepends=(
    python-hatchling
    python-typing_extensions
    python-build
    python-installer
    python-wheel
    python-setuptools)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('0e3461d3303c7aecdaa65a05e39ef6d8b26ce1a4ebe4b9724b573b562487960c')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
