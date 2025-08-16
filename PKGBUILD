# Maintainer: ObserverOfTime <chronobserver@disroot.org>

pkgname=vscode-js-debug-bin
pkgver=1.102.0
pkgrel=1
pkgdesc='A DAP-compatible JavaScript debugger'
arch=(any)
url="https://github.com/microsoft/vscode-js-debug"
license=(MIT)
depends=(nodejs)
conflicts=(vscode-js-debug)
provides=("vscode-js-debug=$pkgver")
source=("$url/releases/download/v$pkgver/js-debug-dap-v${pkgver}.tar.gz")
sha256sums=('6eb0f9c9d5acc124a0cb4ee4e778adf57fb71f113d60aa6c303fc0c1501acc78')

prepare() {
  chmod +x js-debug/src/dapDebugServer.js
  sed -i '1i #!/usr/bin/env node' "$_"
}

package() {
  cd js-debug
  install -d "$pkgdir"/usr/{bin,lib/js-debug}
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE

  cp -r src/* "$pkgdir"/usr/lib/js-debug
  ln -s ../lib/js-debug/dapDebugServer.js "$pkgdir"/usr/bin/js-debug-dap
}
