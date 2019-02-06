# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=minishift
pkgver=1.31.0
pkgrel=1
pkgdesc="Run OpenShift locally"
url="https://github.com/minishift/minishift"
license=('APACHE')
arch=('x86_64')
makedepends=(go git)
optdepends=('virtualbox: to use minishift with VirtualBox virtualization'
            'docker-machine-kvm: to use minishisft with KVM virtualization')
source=(https://github.com/minishift/minishift/archive/v${pkgver}.tar.gz)
sha512sums=('34b52b3897476b75bfdda2e8c1c664979f20bf2ddbd33c18fba26d8533cd3056b28bbad1f8ef6e3d328d130c2979e79eca14534466b80979c98631065772060a')

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
