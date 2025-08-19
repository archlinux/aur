# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-http-response
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.0.9
pkgrel=1
epoch=
pkgdesc="Python http response utils."
arch=('any')
url="https://pypi.org/project/${_name}"
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
sha256sums=('6e1c0b35d0022fb30a3856ffb76d6c022e9a12765045c7aff77bb55d72c446e5')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
