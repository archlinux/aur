# Maintainer: Allen Wild <allenwild93@gmail.com>
# Contributor: Alireza Ayinmehr <alireza.darksun@gmail.com>
# Contributor: Abhishek Mukherjee <amukherjee@tripadvisor.com>
pkgname=docker-credential-secretservice
pkgver=0.9.4
pkgrel=1
pkgdesc="program to use secretservice to keep Docker credentials safe"
arch=(x86_64 i686 aarch64)
url="https://github.com/docker/docker-credential-helpers"
license=('MIT')
depends=('libsecret')
makedepends=('git' 'go')
source=("git+${url}#tag=v${pkgver}")
b2sums=('91d63734b9c02a6e9db77581a5680ee19bd8f1778dba5c9daf0aa916386308103c720cb69f9bb8f68c581786eabbb14214df53ff036f81ce777f5d5e5fd50ead')
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
