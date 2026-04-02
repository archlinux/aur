# Maintainer: CloverGit <clovergit@hotmail.com>

pkgname=python-ida-pro-mcp-git
pkgver=1.4.0.r219.gf1aec3b
pkgrel=1
pkgdesc='Simple MCP Server to allow vibe reversing in IDA Pro.'
arch=('any')
license=('MIT')
url='https://github.com/mrexodia/ida-pro-mcp'

depends=('python' 'python-mcp')
provides=('python-ida-pro-mcp')
conflicts=('python-ida-pro-mcp')

source=("${pkgname}::git+https://github.com/mrexodia/ida-pro-mcp.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set sw=2 ts=2 et:
