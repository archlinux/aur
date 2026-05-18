# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>
pkgname=ossutil2-bin
pkgver=2.3.0
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
sha256sums_x86_64=('3ae4d9fc85a7a6e9f5654d1599766f1a3a42a3692870887b5ae9338d582ef65a')
sha256sums_aarch64=('f6c95ba0c2d2ef30290af686ce4d706c701f4734ce8090bee4288a77e3f1d764')

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
