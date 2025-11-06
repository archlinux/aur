# Maintainer: Tim Kicker <tim@kicker.dev>
pkgname=podliner-bin
pkgver=1.0.14
pkgrel=1
pkgdesc="Podliner: TUI podcast player (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/timkicker/podliner"
license=('MIT')
provides=('podliner')
conflicts=('podliner')
depends=()
source_x86_64=("podliner-${pkgver}-linux-x64.tar.gz::https://github.com/timkicker/podliner/releases/download/v${pkgver}/podliner-linux-x64.tar.gz")
source_aarch64=("podliner-${pkgver}-linux-arm64.tar.gz::https://github.com/timkicker/podliner/releases/download/v${pkgver}/podliner-linux-arm64.tar.gz")
sha256sums_x86_64=('15026c2c16f3587b4b2bac39fa18a4d2562b783f3367c11ae53c94759a69e99c')
sha256sums_aarch64=('af7f72e735256794f6b23ab6bdd5995fe9d132a800db518dd6064f1ddfc31c99')

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


