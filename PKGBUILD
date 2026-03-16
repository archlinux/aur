# Maintainer: Noah <noah@thiering.org>

pkgname=sshconfig-lint-bin
pkgdesc="Linter for OpenSSH client config files"
pkgver=0.4.0
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
sha256sums_x86_64=('0405e838a30edda52f258782d6130cdd0ad270252092499b4191da7579f5d3b1')
sha256sums_aarch64=('ccaa5781db1c300c17056ad19bc412a5cfc8b63b26f55905e47e7e42e824e329')

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
