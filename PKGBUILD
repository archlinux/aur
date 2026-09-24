# Maintainer: Do1e <https://aur.archlinux.org/account/Do1e>

pkgname=python-mijia-api
pkgver=4.4.0
pkgrel=1
pkgdesc="A Python API for Xiaomi Mijia"
arch=('any')
url='https://github.com/Do1e/mijia-api'
license=('GPL-3.0')
depends=(
  'python>=3.10'
  'python-pillow>=11.3.0'
  'python-pycryptodome>=3.23.0'
  'python-qrcode>=8.2'
  'python-requests>=2.32.5'
  'python-tzlocal>=1:5.3.1'
)
optdepends=(
  'python-fastmcp>=3.4.2: MCP server support for the "mijiaAPI mcp" command'
)
makedepends=(
  'uv'
  'python-installer'
)

source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/ea/87/61b4835a141f5d7638d98d4373eb8f89535aa4e0a9cf5dc5ab8b46fab78b/mijiaapi-4.4.0.tar.gz")
sha256sums=('e607c08aad71d4454ee20ccc10753a9e56605168b4c320e16a6820df7c63075c')

build() {
  cd "mijiaapi-$pkgver"
  uv build
}

package() {
  cd "mijiaapi-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
