# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=quickshare-bin
pkgver=0.11.4
pkgrel=1
pkgdesc="Quick and simple file sharing between devices"
arch=('x86_64' 'aarch64')
url="https://github.com/ihexxa/quickshare"
license=('LGPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ihexxa/quickshare/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/quickshare_linux_amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/quickshare_linux_arm64.zip")
sha256sums=('8e1c608ff068dae9f02ca7ed877d310f4877376f20b8458ab568152297031efc')
sha256sums_x86_64=('36256309c20e5494bafc499f5b9288c41c3d12ac63c4ffced25aae6754ae4ce0')
sha256sums_aarch64=('b8434a01bba52feeed64d462a1d2ce110aa36aa7b020376ad0df37718230e7e7')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="dist/quickshare_linux_amd64" ;;
    aarch64) _dir="dist/quickshare_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/quickshare" "${pkgdir}/usr/bin/quickshare"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
