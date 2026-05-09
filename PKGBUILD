# Maintainer: Frestein <fresteinart@gmail.com>

pkgname=rassumfrassum-git
pkgver=0.3.3.r8.g7ab6bf4
pkgrel=1
pkgdesc="LSP/JSONRPC multiplexer for connecting one LSP client to multiple servers"
arch=('any')
url="https://github.com/joaotavora/rassumfrassum"
license=('GPL3')
depends=('python>=3.10')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'git')
provides=('rassumfrassum')
conflicts=('rassumfrassum')
source=("${pkgname}-${pkgver}::git+https://github.com/joaotavora/rassumfrassum.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}-${pkgver}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
