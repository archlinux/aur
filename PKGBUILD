# Maintainer: Max Harmathy <harmathy@alumni.tum.de>

# SPDX-License-Identifier:  0BSD
pkgname=kubectl-rook-ceph
pkgver=0.9.6
pkgrel=1
pkgdesc='kubectl plugin for managing Rook Ceph'
arch=('x86_64')
url='https://github.com/rook/kubectl-rook-ceph'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5e580a42f1fda40a0ec4db0af24bc09f2ec0fcb02393ffb6ba2d7b08ea5c99e2')
sha512sums=('5612e77a5e3b2a2f357f574b7834b9c0dab2e1cdd7a56dc8425733a85801513539ccc51fe62dd2d1efb924467de98b027a90ed282e6e0baefd2d461506d8827f')
b2sums=('e789eda349b628c65b4a8b090d6d55dc2167316e6efd721357963f7daa4436e75633023675d4b52c00bf25e11908e52173e1d631e39e1e6c9741469198f9ed1b')

build() {
  cd "${pkgname}-${pkgver}"

  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -mod=readonly'

  go build -ldflags "-w -s -linkmode=external" -o kubectl-rook_ceph cmd/main.go
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 kubectl-rook_ceph -t "${pkgdir}/usr/bin"
}
