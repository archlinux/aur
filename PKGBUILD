# SPDX-License-Identifier: 0BSD
# Maintainer: Dotenc <security@dotenc.org>

pkgname=dotenc-bin
pkgver=0.14.1
pkgrel=1
pkgdesc='Git-native encrypted environments powered by SSH keys'
arch=('x86_64' 'aarch64')
url='https://dotenc.org'
license=('MIT')
depends=('glibc' 'openssh' 'ca-certificates')
provides=("dotenc=0.14.1")
conflicts=('dotenc')
options=('!strip')
source=(
  'dotenc-0.14.1-LICENSE::https://raw.githubusercontent.com/dotenc/dotenc/v0.14.1/LICENSE'
  'install-method'
)
sha256sums=(
  'd48b1571cf2a471c7e1ee8aad052071db0d15d474bb5e2ca805f613b7cfd1631'
  '4d6db8b1fdb0b4613b9f7e5477d58165a6daac803e8a9fd4e4cf0694fa01bf52'
)
source_x86_64=('dotenc-0.14.1-x86_64.tar.gz::https://github.com/dotenc/dotenc/releases/download/v0.14.1/dotenc-linux-x64.tar.gz')
sha256sums_x86_64=('bd562ea4f060464b65f270378b2aeda8ae558b55312253bf8af68ae6d43131fb')
source_aarch64=('dotenc-0.14.1-aarch64.tar.gz::https://github.com/dotenc/dotenc/releases/download/v0.14.1/dotenc-linux-arm64.tar.gz')
sha256sums_aarch64=('31f43d810b9b06f9af28f95d17301673be10bed948967b0c5726b26a925552ea')

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
  install -Dm644 "$srcdir/dotenc-0.14.1-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
