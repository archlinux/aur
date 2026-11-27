# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=hedos-bin
pkgver=1.6.2
pkgrel=1
pkgdesc="A terminal shelf for the local AI models already on your machine"
arch=('x86_64' 'aarch64')
url="https://github.com/theiskaa/hedos"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/hedos-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/hedos-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('1e174c75267fb120434ad34f22aae383b78093aab66ef3e1ecbd6a88c603dca5')
sha256sums_aarch64=('bbde31feea536973538f057f9696a56642bc5e668471a38a98158038a2e4afd4')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="hedos-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="hedos-aarch64-unknown-linux-gnu" ;;
  esac
  cd "$_dir"
  install -Dm755 "hedos" "${pkgdir}/usr/bin/hedos"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
