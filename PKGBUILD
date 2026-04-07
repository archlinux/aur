# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>
pkgname=ossutil2-bin
pkgver=2.2.2
pkgrel=1
pkgdesc="a tool for managing OSS (Object Storage Service) data"
arch=('x86_64' 'aarch64')
url="https://github.com/aliyun/ossutil"
license=('proprietary')
provides=('ossutil')

source_x86_64=(
"https://gosspublic.alicdn.com/ossutil/v2/${pkgver}/ossutil-${pkgver}-linux-amd64.zip"
)
source_aarch64=(
"https://gosspublic.alicdn.com/ossutil/v2/${pkgver}/ossutil-${pkgver}-linux-arm64.zip"
)
sha256sums_x86_64=('d4308515689144c6b213d4998787abbd232dd6714fc43dedbe87064c2c34dee1')
sha256sums_aarch64=('dcadb6aa97ddbae523e427e9397a529a04c2f21b4204065ce30e21d44908faa0')

prepare() {
  if [[ "$CARCH" == "x86_64" ]]; then
    mv ossutil-${pkgver}-linux-amd64 ossutil-${pkgver}-x86_64
  elif [[ "$CARCH" == "aarch64" ]]; then
    mv ossutil-${pkgver}-linux-arm64 ossutil-${pkgver}-aarch64
  fi
}

package() {
    cd ossutil-${pkgver}-${CARCH}
    install -Dm755 ossutil ${pkgdir}/usr/bin/ossutil
}
