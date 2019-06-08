# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=kvmtop
pkgver=2.1.3
pkgrel=4
pkgdesc="A monitoring tool for black box virtual machines from KVM hypervisor level"
arch=('x86_64')
url="https://github.com/cha87de/kvmtop"
license=('GPL3')
makedepends=('git' 'go' 'libvirt')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cha87de/kvmtop/archive/${pkgver}.tar.gz")
sha512sums=('7d57b25e076d296b878c387b6d84dd6150a5736df8ddd7edf61b67904b24ba674bfe7e67224df6447403285173d347b1825afd6d342126a2f88e50694cd602cc')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}/cmd/kvmtop"
  export GOPATH="${srcdir}"
  export GOBIN=$GOPATH/bin
  go get -v .
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/cmd/kvmtop"
  export GOPATH="${srcdir}"
  export GOBIN=$GOPATH/bin
  go build -v .
}

package() {
  install -Dm 0755 "${srcdir}/${pkgname}-${pkgver}/cmd/kvmtop/kvmtop" "${pkgdir}/usr/bin/kvmtop"
}
