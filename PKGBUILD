# Maintainer: LIghtJUNction <https://github.com/LIghtJUNction>
pkgname=sq-system-one-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='Streaming System One decisions for shell pipelines (Jev, Drex, Laya)'
arch=('x86_64' 'aarch64')
url='https://github.com/LIghtJUNction/sq'
license=('MIT')
provides=("sq-system-one=$pkgver")
conflicts=('sq-system-one' 'sq' 'sequoia-sq')
options=('!strip')
source_x86_64=("https://github.com/LIghtJUNction/sq/releases/download/v0.1.1/sq-v0.1.1-x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('9d71e9fc9ae419403d795e4594054377f7aadd808187dd2f6175842f2e54cf4b')
source_aarch64=("https://github.com/LIghtJUNction/sq/releases/download/v0.1.1/sq-v0.1.1-aarch64-unknown-linux-musl.tar.gz")
sha256sums_aarch64=('d3032b4c691763e86e1c343414e9468a07c3f6708370b5d68941c377d56f649c')

package() {
  local target
  case "$CARCH" in
    x86_64) target=x86_64-unknown-linux-musl ;;
    aarch64) target=aarch64-unknown-linux-musl ;;
  esac
  cd "sq-v${pkgver}-${target}"
  install -Dm755 sq "$pkgdir/usr/bin/sq"
  install -Dm644 sq.service "$pkgdir/usr/lib/systemd/user/sq.service"
  install -Dm644 config.toml "$pkgdir/usr/share/doc/sq-system-one/config.toml"
  install -Dm644 README.md "$pkgdir/usr/share/doc/sq-system-one/README.md"
  install -Dm644 README.zh-CN.md "$pkgdir/usr/share/doc/sq-system-one/README.zh-CN.md"
  cp -r docs config python "$pkgdir/usr/share/doc/sq-system-one/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
