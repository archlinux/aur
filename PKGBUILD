# Maintainer: Tim Kicker <tim@kicker.dev>
pkgname=podliner-bin
pkgver=1.0.10
pkgrel=1
pkgdesc="Podliner: TUI podcast player (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/timkicker/podliner"
license=('MIT')
provides=('podliner')
conflicts=('podliner')
depends=()
source_x86_64=("podliner-${pkgver}-linux-x64.tar.gz::https://github.com/timkicker/podliner/https://github.com/timkicker/podliner/releases/download/v1.0.10/podliner-linux-x64.tar.gz")
source_aarch64=("podliner-${pkgver}-linux-arm64.tar.gz::https://github.com/timkicker/podliner/https://github.com/timkicker/podliner/releases/download/v1.0.10/podliner-linux-arm64.tar.gz")
sha256sums_x86_64=(f978c04ee8f4b7b48583336f275ae2584c7ee600d343e8839b8b79b2f4326859)
sha256sums_aarch64=(92e4193af5f1977891d95f37cddcc29e1ab9dae646d8b19c61fbde06cfe8059f)

package() {
  install -d "${pkgdir}/usr/bin"
  local tarball
  if [[ "$CARCH" == "x86_64" ]]; then
    tarball="${srcdir}/podliner-${pkgver}-linux-x64.tar.gz"
  else
    tarball="${srcdir}/podliner-${pkgver}-linux-arm64.tar.gz"
  fi
  mkdir -p "${srcdir}/podliner-build"
  tar -xzf "$tarball" -C "${srcdir}/podliner-build"
  install -m755 "${srcdir}/podliner-build/podliner" "${pkgdir}/usr/bin/podliner"
}

