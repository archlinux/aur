# Maintainer: Arturo Penen <apenen@gmail.com>

pkgname=docker-machine-driver-vmware
pkgver=0.1.5
pkgrel=4
pkgdesc='Create Docker machines locally on VMware Fusion and Workstation.'
arch=('x86_64')
url='https://github.com/machine-drivers/docker-machine-driver-vmware'
license=('Apache')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/machine-drivers/docker-machine-driver-vmware/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('92512dc85af9ba293e6f9d2b1f39a20daf7debd0aff4047a58b4bcfee9e57d15')

build() {
  cd $pkgname-$pkgver

  # refs: Go package guidelines - https://wiki.archlinux.org/title/Go_package_guidelines
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  export VERSION=$pkgver
  make
}

package() {
  install -Dm 755 "${pkgname}-${pkgver}/out/docker-machine-driver-vmware" "${pkgdir}/usr/bin/docker-machine-driver-vmware"
}
