# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=minishift
pkgver=1.24.0
pkgrel=2
pkgdesc="Run OpenShift locally"
url="https://github.com/minishift/minishift"
license=('APACHE')
arch=('x86_64')
makedepends=(go git)
optdepends=('virtualbox: to use minishift with VirtualBox virtualization'
            'docker-machine-kvm: to use minishisft with KVM virtualization')
source=(https://github.com/minishift/minishift/archive/v${pkgver}.tar.gz)
sha512sums=('0783a4822eba641dd1c85c41df68863df6abfa6cde70908ef35dd97cf910e37b5c0516f44c73ef46470339bda158ab41b5f0a2526b1074d566bcb0d33af3c369')

build() {
  mkdir -p work/{bin,pkg,src/github.com/minishift}
  export GOPATH=${srcdir}/work
  export PATH=$PATH:$GOPATH/bin
  go get github.com/golang/dep/cmd/dep

  mv minishift-${pkgver} work/src/github.com/minishift/minishift
  cd work/src/github.com/minishift/minishift
  make vendor
  make
}

package() {
  install -Dm755 "${srcdir}/work/bin/minishift" "${pkgdir}/usr/bin/minishift"
}
