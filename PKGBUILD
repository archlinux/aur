# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>
pkgname=ossutil2-bin
pkgver=2.4.0
pkgrel=1
pkgdesc="a tool for managing OSS (Object Storage Service) data"
arch=('x86_64' 'aarch64')
url="https://github.com/aliyun/alibabacloud-oss-go-sdk-v2"
license=('proprietary')
provides=('ossutil')

source_x86_64=(
"https://gosspublic.alicdn.com/ossutil/v2/${pkgver}/ossutil-${pkgver}-linux-amd64.zip"
)
source_aarch64=(
"https://gosspublic.alicdn.com/ossutil/v2/${pkgver}/ossutil-${pkgver}-linux-arm64.zip"
)
sha256sums_x86_64=('85edf66b2fb7238f5c7e25cab820cf29312319fe4935b7c86a6b8485eb434f3c')
sha256sums_aarch64=('7767240e9667d1f26fbe4e04f90b796b4356889e77d0076cc8a543c8ce081987')

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
