# Maintainer: Max Harmathy <harmathy@alumni.tum.de>

# SPDX-License-Identifier:  0BSD
pkgname=kubectl-rook-ceph
pkgver=0.9.4
pkgrel=1
pkgdesc='kubectl plugin for managing Rook Ceph'
arch=('x86_64')
url='https://github.com/rook/kubectl-rook-ceph'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('178b12b7beb225243cdedc7bb43b7ae7b475c9ab365b23f4a785d5a4ff75042f')
sha512sums=('fc23e6a59000917ce40cafd553cbd246e21f336eaf873d47136f28ea342b628e0e761cff5f0d2fe7affc77467f67c37a709ae03ecbeeabe2c537022124ad1b15')
b2sums=('2af021c5dae0304cbd126012dbadef916932db7ebce79d17d4b681627464d2bf1adebcd603f32979c0b5b4586621fcf5915e4fd65a9c761737ed2be75f920994')

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
