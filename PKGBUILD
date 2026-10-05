# SPDX-License-Identifier: 0BSD
# Maintainer: Dotenc <security@dotenc.org>

pkgname=dotenc-bin
pkgver=0.15.1
pkgrel=1
pkgdesc='Git-native encrypted environments powered by SSH keys'
arch=('x86_64' 'aarch64')
url='https://dotenc.org'
license=('MIT')
depends=('glibc' 'openssh' 'ca-certificates')
provides=("dotenc=0.15.1")
conflicts=('dotenc')
options=('!strip')
source=(
  'dotenc-0.15.1-LICENSE::https://raw.githubusercontent.com/dotenc/dotenc/v0.15.1/LICENSE'
  'install-method'
)
sha256sums=(
  'd48b1571cf2a471c7e1ee8aad052071db0d15d474bb5e2ca805f613b7cfd1631'
  '4d6db8b1fdb0b4613b9f7e5477d58165a6daac803e8a9fd4e4cf0694fa01bf52'
)
source_x86_64=('dotenc-0.15.1-x86_64.tar.gz::https://github.com/dotenc/dotenc/releases/download/v0.15.1/dotenc-linux-x64.tar.gz')
sha256sums_x86_64=('52c65e3ac4328815c62f5c388e4992d28a8a163ab14e0ec0b1103e2f9a41a135')
source_aarch64=('dotenc-0.15.1-aarch64.tar.gz::https://github.com/dotenc/dotenc/releases/download/v0.15.1/dotenc-linux-arm64.tar.gz')
sha256sums_aarch64=('9bb3f412cb2a9c22eae05f1501fbe63c6d3977c707b13f6f2ad5516574865fea')

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
  install -Dm644 "$srcdir/dotenc-0.15.1-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
