# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-jlcpcb-search-mcp
_name=${pkgname#python-}
pkgver=1.2.1
pkgrel=1
pkgdesc="MCP server for searching JLCPCB components with live stock and pricing"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/peterb154/jlcpcb-search-mcp"
_pydeps=(
    fastmcp
    platformdirs
    requests
)
depends=('python'
    "${_pydeps[@]/#/python-}")
makedepends=(
    git
    uv
    'python-hatchling'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel')
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('cd00a8edefe9cf5cdb665e35d92f673086b43db47210e376f1d4c0cdff7bbd4f')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    #     install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
