# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=trnovel-bin
pkgver=0.19.0
pkgrel=1
pkgdesc="A terminal novel reader for local and network novels, with AI-assisted book-source generation"
arch=('x86_64' 'aarch64')
url="https://github.com/yexiyue/TRNovel"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_tag="trnovel-v${pkgver}"
_dl="${url}/releases/download/${_tag}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/trnovel-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/trnovel-aarch64-unknown-linux-musl.tar.xz")
sha256sums_x86_64=('e98eb5db05efcc015d1f101dfff6eac1e5dc9cb2f77e3f76daafc5fb8a76d7d4')
sha256sums_aarch64=('44cb766b6333daf541084b40e91e79e8adcf7d4f1d8a177ca688d4e40ee24ed9')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="trnovel-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="trnovel-aarch64-unknown-linux-musl" ;;
  esac
  cd "$_dir"
  install -Dm755 "trnovel" "${pkgdir}/usr/bin/trnovel"
  install -Dm755 "trn" "${pkgdir}/usr/bin/trn"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
