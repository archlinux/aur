# Maintainer: Nikolai Käck <nikolaikack@nikoware.com>

pkgname=ast-grep-mcp-git
_realname=ast-grep-mcp
pkgver=r82.51d5a23
pkgrel=1
pkgdesc="Model Context Protocol server for ast-grep structural code search"
arch=('any')
url="https://github.com/ast-grep/ast-grep-mcp"
license=('MIT')
depends=('python>=3.13' 'python-pydantic' 'python-mcp' 'python-yaml')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('ast-grep-mcp')
conflicts=('ast-grep-mcp')
optdepends=('ast-grep: structural code search backend for the MCP server')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_realname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${_realname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_realname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
