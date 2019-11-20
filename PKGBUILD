# Maintainer: Mateusz Kaczanowski <kaczanowski.mateusz@gmail.com>
pkgname='packer-builder-arm-git'
provides=('packer-builder-arm')
pkgver=33.f7246dc
pkgrel=1
pkgdesc="Packer plugin to build ARM images"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/mkaczanowski/packer-builder-arm"
license=('APACHE')
depends=('glibc' 'multipath-tools' 'qemu-arm-static')
makedepends=('go')
optdepends=()
conflicts=()
backup=()
options=()
source=("git://github.com/mkaczanowski/packer-builder-arm.git")
md5sums=('SKIP')

pkgver() {
    cd "packer-builder-arm"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  export GOPATH="${srcdir}"

  cd "${srcdir}/packer-builder-arm"
  go install \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}" \
    ./...
}

package() {
  install -Dm755 bin/packer-builder-arm "${pkgdir}/usr/bin/packer-builder-arm"
}
