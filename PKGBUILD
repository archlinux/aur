# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-mcp-types
_name=${pkgname#python-}
pkgver=2.3.0
pkgrel=1
pkgdesc="Model Context Protocol wire types"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/modelcontextprotocol/python-sdk"
_pydeps=(
    pydantic
    typing_extensions
)
depends=(
    'python'
    "${_pydeps[@]/#/python-}"
)
makedepends=(
    git
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'python-hatchling'
    'python-uv-dynamic-versioning'
)
optdepends=(
    'python-mcp: Model Context Protocol SDK'
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('7cd84a224fdc6b05dd846c3b86fcc75011870c3358a2c844483adc60416ba9c2')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "${srcdir}/${_name}/src/mcp-types"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}/src/mcp-types"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 ../../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
