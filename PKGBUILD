# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-p115cipher
_name=${pkgname#python-}
pkgver=0.0.4
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
    python-setuptools)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('4b5afcac9a7515f8b9173eeea6a2f0ddfa1125e79c64e360d4054b0aa239b83e')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
