# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=minishift
pkgver=1.18.0
pkgrel=1
pkgdesc="Run OpenShift locally"
url="https://github.com/minishift/minishift"
license=('APACHE')
arch=('x86_64')
makedepends=(go git)
optdepends=('virtualbox: to use minishift with VirtualBox virtualization'
            'docker-machine-kvm: to use minishisft with KVM virtualization')
source=(https://github.com/minishift/minishift/archive/v${pkgver}.tar.gz)
sha512sums=('4b5873f64e48c9a3049f7fc1bf40a81db3141eab54c6b62b8fa6be88122257b599d4660c51d5cd2f522bed0cd377de1dd78502e133671aaf9247414b958722b5')

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
