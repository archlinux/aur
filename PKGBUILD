# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-undefined
_name=${pkgname//-/_}
pkgver=0.0.4
pkgrel=1
epoch=
pkgdesc="Python undefined type."
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
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
sha256sums=('ed0939e5ee78eb2a498bb0eeb9a9b42fe4239c9eb98af0c42ee6e25b5f55e373')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    #     python_version=$(python --version 2>&1)
    #     python_version=${python_version#Python }
    #     python_version=$(echo "$python_version" | awk -F'.' '{print $1"."$2}')
    #     rm -rf ${pkgdir}/usr/lib/python${python_version}/site-packages/LICENSE
}
