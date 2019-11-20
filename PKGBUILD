# Maintainer: Mateusz Kaczanowski <kaczanowski.mateusz@gmail.com>
pkgname='packer-post-processor-flasher-git'
provides=('packer-post-processor-flasher')
pkgver=4.d40a32d
pkgrel=1
pkgdesc="Packer plugin to dump image on physical device"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/mkaczanowski/packer-post-processor-flasher"
license=('APACHE')
depends=('glibc' 'multipath-tools')
makedepends=('go')
optdepends=()
conflicts=()
backup=()
options=()
source=("git://github.com/mkaczanowski/packer-post-processor-flasher.git")
md5sums=('SKIP')

pkgver() {
    cd "packer-post-processor-flasher"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  export GOPATH="${srcdir}"

  cd "${srcdir}/packer-post-processor-flasher"
  go install \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}" \
    ./...
}

package() {
  install -Dm755 bin/packer-post-processor-flasher "${pkgdir}/usr/bin/packer-post-processor-flasher"
}
