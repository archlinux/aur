# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=llama.cpp-server-tray
_pname=llama_cpp_server_tray
pkgver=0.5
pkgrel=1
pkgdesc="Companion system tray app for llama.cpp-server-service"
arch=('any')
url="https://github.com/envolution/llama.cpp-server-tray"
license=('MIT')
depends=('pyside6' 'python')
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-hatchling'
)
options=(!strip !debug)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/envolution/llama.cpp-server-tray/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9f095e5f1ddb8636e1da083d95ebf5933c5834d7174598a1242caf24607f6cd9')
build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}
package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install non-Python files such as icons, documentation, and desktop entries
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Desktop file and icons
  install -Dm644 llama.cpp-server-tray.desktop "$pkgdir/usr/share/applications/llama.cpp-server-tray.desktop"

  # Install the SVG icons for tray states
  install -Dm644 icons/llama.cpp-server-tray_svg.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/llama.cpp-server-tray_svg.svg"
  install -Dm644 icons/llama.cpp-server-tray_off.svg "$pkgdir/usr/share/icons/hicolor/48x48/apps/llama.cpp-server-tray_off.svg"
  install -Dm644 icons/llama.cpp-server-tray_on.svg "$pkgdir/usr/share/icons/hicolor/48x48/apps/llama.cpp-server-tray_on.svg"
}
# vim:set ts=2 sw=2 et:
