# Maintainer: Allen Wild <allenwild93@gmail.com>
# Contributor: Alireza Ayinmehr <alireza.darksun@gmail.com>
# Contributor: Abhishek Mukherjee <amukherjee@tripadvisor.com>
pkgname=docker-credential-secretservice
pkgver=0.9.1
pkgrel=1
pkgdesc="program to use secretservice to keep Docker credentials safe"
arch=(x86_64 i686 aarch64)
url="https://github.com/docker/docker-credential-helpers"
license=('MIT')
depends=('libsecret')
makedepends=('git' 'go')
source=("git+${url}#tag=v${pkgver}")
b2sums=('132ea2c65ab42501d16d6af80f7e50ce929c93967ce73996a2df1c3da1d3df8e2e6ccd5eae85d0f706b73e6acde9798d79b8d69f17cb9feda128535ad64b6fe0')
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
