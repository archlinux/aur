# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=minigraf-bin
pkgver=2.0.12
pkgrel=1
pkgdesc="Embedded graph memory for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/project-minigraf/minigraf"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/minigraf-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/minigraf-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('8e783a6f025c2e0ca36a025b4e5a167b3f6c5e77c5217fa6c63f1c280a28b38a')
sha256sums_aarch64=('8034cffda927bb3afc510ee1dd979b83d916a3a7611ec03099266d4ca1dd3655')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="minigraf-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="minigraf-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/minigraf" "${pkgdir}/usr/bin/minigraf"
  install -Dm644 "${_dir}/LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${_dir}/LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
