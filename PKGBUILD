# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>
pkgname=ossutil2-bin
pkgver=2.2.1
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
sha256sums_x86_64=('fbf1026bd383a5d9bee051cd64a6226c730357ba569491f7c7b91af66560ef1d')
sha256sums_aarch64=('b7680e79aec0adc9d42a12b795612680a58efec1fad24b0ceb9e13b2390c6652')

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
