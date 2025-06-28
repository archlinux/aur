# Contributor: Mateusz Kaczanowski <kaczanowski.mateusz@gmail.com>

pkgname='packer-post-processor-flasher-git'
provides=('packer-post-processor-flasher')
pkgver=r8.7856deb
pkgrel=1
pkgdesc="Packer plugin to dump image on physical device"
arch=('x86_64')
url="https://github.com/mkaczanowski/packer-post-processor-flasher"
license=('Apache-2.0')
depends=('glibc' 'multipath-tools')
makedepends=('git' 'go')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "packer-post-processor-flasher"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "packer-post-processor-flasher"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build
}

package() {
  cd "packer-post-processor-flasher"
  install -Dm755 packer-post-processor-flasher "${pkgdir}/usr/bin/packer-post-processor-flasher"
}
