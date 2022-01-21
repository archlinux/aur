# Maintainer: Arturo Penen <apenen@gmail.com>

pkgname=docker-machine-driver-vmware
pkgver=0.1.5
pkgrel=1
pkgdesc='Create Docker machines locally on VMware Fusion and Workstation.'
arch=('x86_64')
url='https://github.com/machine-drivers/docker-machine-driver-vmware'
license=('Apache')
makedepends=('go1.15'
             'git')

build() {
  mkdir -p $pkgname-$pkgver
  cd $pkgname-$pkgver
  export GOPATH=`pwd`
  #export GOFLAGS="-modcacherw"
  go1.15 get -d github.com/machine-drivers/docker-machine-driver-vmware
  cd ${GOPATH}/src/github.com/machine-drivers/docker-machine-driver-vmware

  git checkout tags/v$pkgver
  export VERSION=$pkgver
  make
}

package() {
  install -Dm 755 "${GOPATH}/src/github.com/machine-drivers/docker-machine-driver-vmware/out/docker-machine-driver-vmware" "${pkgdir}/usr/bin/docker-machine-driver-vmware"
}
