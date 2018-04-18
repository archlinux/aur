# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=minishift
pkgver=1.16.0
pkgrel=1
pkgdesc="Run OpenShift locally"
url="https://github.com/minishift/minishift"
license=('APACHE')
arch=('x86_64')
makedepends=(go git)
optdepends=('virtualbox: to use minishift with VirtualBox virtualization'
            'docker-machine-kvm: to use minishisft with KVM virtualization')
source=(https://github.com/minishift/minishift/archive/v${pkgver}.tar.gz)
sha512sums=('aa51f95b32e6362061c6f19aee47b0a33a7addf65513580b2cec30beb5f2aabc507f7336a961230419279dfc6c4f82dc138587f5fb33439c595d7603e41747aa')

prepare() {
  mkdir -p work/{bin,pkg,src/github.com/minishift}
  export GOPATH=${srcdir}/work
  export PATH=$PATH:$GOPATH/bin
  go get github.com/golang/dep/cmd/dep
  mv minishift-${pkgver} work/src/github.com/minishift/minishift
}

build() {
  cd work/src/github.com/minishift/minishift
  make vendor
  make
}

# check() {
#   cd work/src/github.com/minishift/minishift
#   make test
# }

package() {
  install -Dm755 "${srcdir}/work/bin/minishift" "${pkgdir}/usr/bin/minishift"
}
