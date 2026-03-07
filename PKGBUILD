# Maintainer: Noah <noah@thiering.org>

pkgname=sshconfig-lint-bin
pkgdesc="Linter for OpenSSH client config files"
pkgver=0.3.0
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/Noah4ever/sshconfig-lint"
license=('MIT')
depends=('glibc')

provides=('sshconfig-lint')
conflicts=('sshconfig-lint')

source=(
  "LICENSE::https://raw.githubusercontent.com/Noah4ever/sshconfig-lint/v${pkgver}/LICENSE"
)
source_x86_64=(
  "sshconfig-lint-linux-x86_64.tar.gz::${url}/releases/download/v${pkgver}/sshconfig-lint-linux-x86_64.tar.gz"
)
source_aarch64=(
  "sshconfig-lint-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/sshconfig-lint-linux-arm64.tar.gz"
)

sha256sums=('639f6db74e400988e217e0b995eecab4d4a38a2f36e6e2a90c6f6b477b69c648')
sha256sums_x86_64=('4ecfdc6c0eaae17b613f31f162f25038f5a348138a88e677125c1a3af88dc0a6')
sha256sums_aarch64=('4c63fc57074e3e586ead988a79d964b075ce44735f0148e0b6845d6a153fdd92')

package() {
  cd "$srcdir"

  case "$CARCH" in
    x86_64) bin="sshconfig-lint-linux-x86_64" ;;
    aarch64) bin="sshconfig-lint-linux-arm64" ;;
    *) echo "Unsupported arch: $CARCH" >&2; return 1 ;;
  esac

  install -Dm755 "$bin" "$pkgdir/usr/bin/sshconfig-lint"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
