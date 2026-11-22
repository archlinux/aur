# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=bunflared-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Share localhost on a temporary public HTTPS link through a Cloudflare quick tunnel"
arch=('x86_64' 'aarch64')
url="https://github.com/mirkobozzetto/bunflared"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/bunflared-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/bunflared-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('387687ff3ee8582eb7dbdd4caace8ae3a8567c40b03d5f2ba801b564ca00b80f')
sha256sums_aarch64=('e611628baa766218aa929624b852ba3e88c6d3dc7c45247f05944f22d6b1f5b8')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="bunflared-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="bunflared-aarch64-unknown-linux-gnu" ;;
  esac
  cd "$_dir"
  install -Dm755 "bunflared" "${pkgdir}/usr/bin/bunflared"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
