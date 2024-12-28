# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-guardpost
_name=${pkgname#python-}
pkgver=1.0.2
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
sha256sums=('4566616c1bc01c148275ed8d1cd56f7dffeced490c7d8c599c90293308e55c94')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
