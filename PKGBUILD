# Maintainer: Alex Wicks <alex@awicks.io>
pkgname='packer-provisioner-goss'
provides=('packer-provisioner-goss')
pkgver=3.1.2
pkgrel=1
pkgdesc='Goss Provisioner for Packer'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/YaleUniversity/packer-provisioner-goss'
license=('MIT')
depends=(
  'glibc'
  'goss'
  'multipath-tools'
)
makedepends=('go')
optdepends=()
conflicts=()
backup=()
options=()
source=(
  "git://github.com/YaleUniversity/packer-provisioner-goss.git#tag=v${pkgver}"
)
sha256sums=('SKIP')

build() {
  export GOPATH="${srcdir}"

  cd "${srcdir}/packer-provisioner-goss"
  go install \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}" \
    ./...
}

package() {
  install -Dm755 bin/packer-provisioner-goss "${pkgdir}/usr/bin/packer-provisioner-goss"
}

