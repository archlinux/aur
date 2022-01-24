# Maintainer: Arturo Penen <apenen@gmail.com>

pkgname=docker-machine-driver-vmware
pkgver=0.1.5
pkgrel=2
pkgdesc='Create Docker machines locally on VMware Fusion and Workstation.'
arch=('x86_64')
url='https://github.com/machine-drivers/docker-machine-driver-vmware'
license=('Apache')
makedepends=('go'
             'git')
source=("git+$url#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd $pkgname

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
  install -Dm 755 "${pkgname}/out/docker-machine-driver-vmware" "${pkgdir}/usr/bin/docker-machine-driver-vmware"
}
