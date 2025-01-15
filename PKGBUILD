# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
pkgname=gitsign-credential-cache-bin
pkgver="0.12.0"
pkgrel=1
pkgdesc="Helper binary that allows users to cache signing credentials"
url="https://github.com/sigstore/gitsign/"
arch=(any)
license=('Apache-2.0')
depends=()
provides=("gitsign-credential-cache")
conflicts=("gitsign-credential-cache")

source=(
  "gitsign-credential-cache::https://github.com/sigstore/gitsign/releases/download/v0.12.0/gitsign-credential-cache_0.12.0_linux_amd64"
  "gitsign-credential-cache.service"
  "gitsign-credential-cache.socket"
)
# add dummy entries for `make generate-checksums` to create SHA256 instead of MD5 check sums
sha256sums=(
  "7f1823ca18201ea26ffd973c439195c11c42774e15e5a8a1b9cc23ae9b566ccf"
  "SKIP"
  "SKIP"
)

build() {
  true
}

package() {
  install -d "$pkgdir"/usr/bin
  install -m 755 gitsign-credential-cache "$pkgdir"/usr/bin/
  install -m 644 -D -t "$pkgdir"/usr/lib/systemd/user/ gitsign-credential-cache.{socket,service}
}
