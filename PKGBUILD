# Maintainer: Yousa-Mirage <Yousa-Mirage@foxmail.com>

pkgname=r-savvy-cli-bin
pkgver=0.11.0
pkgrel=1
pkgdesc='CLI for the savvy framework for building R packages with Rust (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/yutannihilation/savvy'
license=('MIT')

depends=(
  'gcc-libs'
  'glibc'
)

provides=(
  'r-savvy-cli'
)

conflicts=(
  'r-savvy-cli'
)

source=(
  "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/yutannihilation/savvy/v${pkgver}/LICENSE.md"
)

source_x86_64=(
  "https://github.com/yutannihilation/savvy/releases/download/v${pkgver}/savvy-cli-x86_64-unknown-linux-gnu.tar.xz"
)

source_aarch64=(
  "https://github.com/yutannihilation/savvy/releases/download/v${pkgver}/savvy-cli-aarch64-unknown-linux-gnu.tar.xz"
)

sha256sums=(
  'b88d82e847cbb64a9b7dc0587af1849f6dc3edfa0201dda5a29613cb34268247'
)

sha256sums_x86_64=(
  '09925acd1af92771a1bb6a0a5f709346ac08142819f4820d043cd4842e6cd7cf'
)

sha256sums_aarch64=(
  '7f1a471c148d66d7e2a6775e483f53592e69cba6ab8cd3254e97b6db66e492eb'
)

package() {
  local _target

  case "$CARCH" in
    x86_64)
      _target='x86_64-unknown-linux-gnu'
      ;;
    aarch64)
      _target='aarch64-unknown-linux-gnu'
      ;;
    *)
      error "Unsupported architecture: $CARCH"
      return 1
      ;;
  esac

  install -Dm755 \
    "$srcdir/savvy-cli-${_target}/savvy-cli" \
    "$pkgdir/usr/bin/savvy-cli"

  install -Dm644 \
    "$srcdir/LICENSE-${pkgver}.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
