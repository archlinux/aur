# Maintainer: Allen Wild <allenwild93@gmail.com>
# Contributor: Alireza Ayinmehr <alireza.darksun@gmail.com>
# Contributor: Abhishek Mukherjee <amukherjee@tripadvisor.com>
pkgname=docker-credential-secretservice
pkgver=0.9.2
pkgrel=1
pkgdesc="program to use secretservice to keep Docker credentials safe"
arch=(x86_64 i686 aarch64)
url="https://github.com/docker/docker-credential-helpers"
license=('MIT')
depends=('libsecret')
makedepends=('git' 'go')
source=("git+${url}#tag=v${pkgver}")
b2sums=('c6976d4a00aea9f4d0766ba544c01bf01549d492bc6121f31cb2edc975be81524d35fd56e20e4217f7fc91e6fd21e3d9b94a2c9b07608a6ea1a1787e347d013a')
install=$pkgname.install

build() {
  cd "$srcdir/docker-credential-helpers"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-v -buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make secretservice
}

package() {
  cd "$srcdir/docker-credential-helpers"
  install -Dm755 bin/build/docker-credential-secretservice "$pkgdir/usr/bin/docker-credential-secretservice"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


# vim:set ts=2 sw=2 et:
