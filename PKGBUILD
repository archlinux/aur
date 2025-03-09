# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-partial
_name=${pkgname//-/_}
pkgver=0.0.6
pkgrel=5
epoch=
pkgdesc="Python partial."
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    #AUR
    python-undefined
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
sha256sums=('41de075d9a01ec9a5981591a6944c4b4cbfbb9da4d259814e55e21a70dd81e43')

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
