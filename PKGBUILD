# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rimage-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="Image optimization CLI inspired by Squoosh"
arch=('x86_64' 'aarch64')
url="https://github.com/vlad-salone/rimage"
license=('Apache-2.0')
depends=('dav1d' 'glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/rimage-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/rimage-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('71e5b5b09e61e27ae71d98688216410cf2ccbdd3d5ddc95b0811632c2225fbc2')
sha256sums_aarch64=('35493f0539dd731867107194aa5869588eb8577873fb23ebf506ebe93b659917')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="rimage-${pkgver}-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="rimage-${pkgver}-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/rimage" "${pkgdir}/usr/bin/rimage"
  install -Dm644 "${_dir}/LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${_dir}/LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
