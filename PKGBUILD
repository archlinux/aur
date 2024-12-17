# Maintainer: ObserverOfTime <chronobserver@disroot.org>

pkgname=vscode-js-debug-bin
pkgver=1.96.0
pkgrel=1
pkgdesc='A DAP-compatible JavaScript debugger'
arch=(any)
url="https://github.com/microsoft/vscode-js-debug"
license=(MIT)
depends=(nodejs)
conflicts=(vscode-js-debug)
provides=("vscode-js-debug=$pkgver")
source=("$url/releases/download/v$pkgver/js-debug-dap-v${pkgver}.tar.gz")
sha256sums=('db2b9d19d9163adb3e37d8b961c9f39797772d35f96710b881acf5aba2417e7c')

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
