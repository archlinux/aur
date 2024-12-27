# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-undefined
_name=${pkgname//-/_}
pkgver=0.0.3
pkgrel=4
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
sha256sums=('05a0175a29cee018c97efe28e288cea9ee894bfd6e076f3ca46e988a3d43a524')

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
