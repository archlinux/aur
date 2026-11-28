# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=diesel-guard-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="Lint dangerous Postgres migration patterns in Diesel and SQLx"
arch=('x86_64' 'aarch64')
url="https://github.com/ayarotsky/diesel-guard"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/diesel-guard-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/diesel-guard-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('8f2ada3d3ca806e20bff15a20a46431f736c1a57d23f8bba615dfe1d6262c7a5')
sha256sums_aarch64=('40c5954e634ff64fa46b7dea52ac2bc0a3e0369535583664f1038a47e8239607')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="diesel-guard-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="diesel-guard-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/diesel-guard" "${pkgdir}/usr/bin/diesel-guard"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
