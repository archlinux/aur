# Maintainer: Libertaria CI <ci@libertaria.org>
pkgname=citadel-bin
_upstream_version=0.1.0
pkgver=0.1.0
pkgrel=1
pkgdesc="Citadel infrastructure control plane binary"
url="https://git.sovereign-society.org/Citadel/citadel"
license=('custom:LCL-1.0')
arch=('x86_64' 'aarch64')
conflicts=('citadel')
depends=("glibc")
provides=('citadel')
source=(
  "https://git.sovereign-society.org/Citadel/citadel/releases/download/v${_upstream_version}/citadel_${_upstream_version}_linux_amd64"
  "https://git.sovereign-society.org/Citadel/citadel/releases/download/v${_upstream_version}/citadel_${_upstream_version}_linux_arm64"
  "https://git.sovereign-society.org/Citadel/citadel/releases/download/v${_upstream_version}/SHA256SUMS"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
  case "$CARCH" in
    x86_64)
      binary="citadel_${_upstream_version}_linux_amd64"
      ;;
    aarch64)
      binary="citadel_${_upstream_version}_linux_arm64"
      ;;
    *)
      echo "unsupported architecture: $CARCH" >&2
      return 1
      ;;
  esac

  install -Dm755 "$binary" "$pkgdir/usr/bin/citadel"
}
