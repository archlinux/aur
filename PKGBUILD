# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=gemini-api-mcp
pkgver=0.1.0
pkgrel=1
pkgdesc="MCP server helper interface for the official Google Gemini API CLI (gemini-api)"
arch=('any')
url="https://github.com/google-gemini/gemini-api-cli"
license=('Apache-2.0')
depends=('python' 'python-mcp' 'gemini-api-cli')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')

source=('pyproject.toml'
        'README.md'
        '__init__.py'
        '__main__.py'
        'runner.py'
        'server.py')
sha256sums=('d9c646251d2a0106535bbd1842bc4dcd7cb3ef884ef916da7ee8beee4aebbeeb'
            '9066adbe898a4df0af6f8dc343da82d550d993159748d40477134b3bb114b5be'
            '5bc16a895be24bc270c14a181fd6911490c1e1c3526dbd527bc55f76113bcc96'
            'f3ff67b1c6867bf9285caa29fcb9ca63e3032e31813ff6f579fd19293b4ff41d'
            'c4089dfd2a46da49b308524a56d50a585ff9284f5ca9f6da986b4fb63bd22865'
            'f00619dbd68fc6b391e09737086ab4795fb81bb2a7ae14ea4c168cbba461f5e7')

prepare() {
  mkdir -p "${srcdir}/gemini_api_mcp"
  cp "${srcdir}/__init__.py" "${srcdir}/gemini_api_mcp/"
  cp "${srcdir}/__main__.py" "${srcdir}/gemini_api_mcp/"
  cp "${srcdir}/runner.py" "${srcdir}/gemini_api_mcp/"
  cp "${srcdir}/server.py" "${srcdir}/gemini_api_mcp/"
}

build() {
  cd "${srcdir}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
