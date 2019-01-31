# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=packer-builder-arm-image
pkgver=0.1.0
pkgrel=1
pkgdesc="Packer plugin for ARM images"
url="https://github.com/solo-io/packer-builder-arm-image"
arch=("x86_64")
license=(unknown)
makedepends=(go-pie)
provides=(packer-builder-arm-image)
conflicts=(packer-builder-arm-image)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/solo-io/packer-builder-arm-image/archive/v${pkgver}.tar.gz")
sha256sums=('d7cc1ded82d55e45918b0a269726ca5720ffa81447d03fbe53ee5a6a66283527')

prepare() {
  mkdir -p src/github.com/solo-io/
  ln -rTsf "${pkgname}-${pkgver}" src/github.com/solo-io/packer-builder-arm-image
}

build() {
  export GOPATH="${srcdir}"
  cd src/github.com/solo-io/packer-builder-arm-image
  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}" \
    .
}

package() {
  install -Dm755 src/github.com/solo-io/packer-builder-arm-image/packer-builder-arm-image "${pkgdir}/usr/bin/packer-builder-arm-image"
}
