# Maintainer: Allen Wild <allenwild93@gmail.com>
# Contributor: Alireza Ayinmehr <alireza.darksun@gmail.com>
# Contributor: Abhishek Mukherjee <amukherjee@tripadvisor.com>
pkgname=docker-credential-secretservice
pkgver=0.9.3
pkgrel=1
pkgdesc="program to use secretservice to keep Docker credentials safe"
arch=(x86_64 i686 aarch64)
url="https://github.com/docker/docker-credential-helpers"
license=('MIT')
depends=('libsecret')
makedepends=('git' 'go')
source=("git+${url}#tag=v${pkgver}")
b2sums=('fa124c3f999409abb74510f0b0b8327dbd05be761d6fe6ab44dd556d0113371faf0c88a695dbf07b17092e59bd057e2a182882ad53e680085261b2a510d94160')
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
