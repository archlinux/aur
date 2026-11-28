# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rustqc-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Fast quality control tools for genomic sequencing data"
arch=('x86_64' 'aarch64')
url="https://github.com/seqeralabs/RustQC"
license=('GPL-3.0-only')
depends=('freetype2' 'glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/rustqc-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/rustqc-linux-aarch64.tar.gz")
sha256sums_x86_64=('2fa72e96a4dbeae06eaf53f3f75850ba4f8b82b086d09e736c4e214078bf804a')
sha256sums_aarch64=('036cc392672d6aa31e42fc1eaf37c5b8a591bcfc91505e1405666f424f3b0769')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="rustqc-linux-x86_64" ;;
    aarch64) _dir="rustqc-linux-aarch64" ;;
  esac
  install -Dm755 "${_dir}/rustqc" "${pkgdir}/usr/bin/rustqc"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
