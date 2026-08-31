# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-p115cipher
_name=${pkgname#python-}
pkgver=0.0.6
pkgrel=1
epoch=
pkgdesc="115 cipher module."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-lz4
    python-ecdsa
    python-pycryptodome
    #AUR
    python-iterutils
)
makedepends=(
    python-poetry
    python-build
    python-installer
    python-wheel
    python-setuptools
)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('b67fd56ed0bdcab2b7a4d21b5750371f4f2dd2cdc970acf9941b92a8d28da1af')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE*
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
