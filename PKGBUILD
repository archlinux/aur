# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-jlcpcb-search-mcp
_name=${pkgname#python-}
pkgver=1.1.4
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
sha256sums=('cbc779a8d7d3c489dcf3442e710469a5272e55c308ff1f6e832510ab71cd6b9a')

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
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
