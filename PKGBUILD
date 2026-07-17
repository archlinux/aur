# Maintainer: Mateusz Kaczanowski <mkaczanowski-aur@proton.me>
pkgname=packer-plugin-builder-arm-git
pkgver=1.1.6
pkgrel=1
pkgdesc="Packer plugin to build ARM images"
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h' 'i686')
url="https://github.com/mkaczanowski/packer-plugin-builder-arm"
license=('Apache')
depends=('glibc' 'multipath-tools' 'qemu-user-static')
makedepends=('go' 'git')
provides=('packer-builder-arm')
options=('!lto')
source=("git+https://github.com/mkaczanowski/packer-plugin-builder-arm.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "packer-plugin-builder-arm"
  export CGO_ENABLED=0
  go build -trimpath -ldflags "-s -w" -o packer-plugin-builder-arm .
}

package() {
  install -Dm755 "packer-plugin-builder-arm/packer-plugin-builder-arm" "${pkgdir}/usr/bin/packer-plugin-builder-arm"
}
