# SPDX-License-Identifier: 0BSD
# Maintainer: Dotenc <security@dotenc.org>

pkgname=dotenc-bin
pkgver=0.13.0
pkgrel=1
pkgdesc='Git-native encrypted environments powered by SSH keys'
arch=('x86_64' 'aarch64')
url='https://dotenc.org'
license=('MIT')
depends=('glibc' 'openssh' 'ca-certificates')
provides=("dotenc=0.13.0")
conflicts=('dotenc')
options=('!strip')
source=(
  'dotenc-0.13.0-LICENSE::https://raw.githubusercontent.com/dotenc/dotenc/v0.13.0/LICENSE'
  'install-method'
)
sha256sums=(
  'd48b1571cf2a471c7e1ee8aad052071db0d15d474bb5e2ca805f613b7cfd1631'
  '4d6db8b1fdb0b4613b9f7e5477d58165a6daac803e8a9fd4e4cf0694fa01bf52'
)
source_x86_64=('dotenc-0.13.0-x86_64.tar.gz::https://github.com/dotenc/dotenc/releases/download/v0.13.0/dotenc-linux-x64.tar.gz')
sha256sums_x86_64=('63b6b9080bee258835bc0b0e2cd08ff018cc02af76f926dc5a6d8446092a84c0')
source_aarch64=('dotenc-0.13.0-aarch64.tar.gz::https://github.com/dotenc/dotenc/releases/download/v0.13.0/dotenc-linux-arm64.tar.gz')
sha256sums_aarch64=('0967925ad700bd3327666f56def0b6097d6e7d2a54ef28e346c12202cdc2a4e8')

check() {
  local binary
  case "$CARCH" in
    x86_64) binary='dotenc-linux-x64' ;;
    aarch64) binary='dotenc-linux-arm64' ;;
    *) return 1 ;;
  esac

  "$srcdir/$binary" --version | grep -Fqx "$pkgver"
}

package() {
  local binary
  case "$CARCH" in
    x86_64) binary='dotenc-linux-x64' ;;
    aarch64) binary='dotenc-linux-arm64' ;;
    *) return 1 ;;
  esac

  install -Dm755 "$srcdir/$binary" "$pkgdir/usr/bin/dotenc"
  install -Dm644 "$srcdir/install-method" "$pkgdir/usr/share/dotenc/install-method"
  install -Dm644 "$srcdir/dotenc-0.13.0-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
