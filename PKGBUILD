# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-ariarpc
_name=${pkgname#python-}
pkgver=0.0.2.1
pkgrel=1
epoch=
pkgdesc="Python aria2 RPC call."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-httpx
    python-orjson
    # AUR
    python-httpx-request
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
sha256sums=('32ec9fc87c6bd30ac4a5297dae222a1d31b9a2562ba1a62e155c1c691bd1f156')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
