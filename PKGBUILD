# Maintainer: Nadir Boussoukaia <nad4reg AT gmail DOT com>
pkgname=b3sumr
pkgver=0.3.0
pkgrel=1
pkgdesc="Compare large folders recursively using BLAKE3 checksum and multithreaded per CPU core"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/boussou/b3sumr"
license=('custom')
depends=('glibc')
makedepends=('go')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  
  go build -o b3sumr .
}

package() {
  cd "$srcdir/$pkgname"
  
  install -Dm755 b3sumr "$pkgdir/usr/bin/b3sumr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
sha256sums=('2307318b5b0548906d838ee3ca19c8ce886be415155a5b060c5cbc31093c857c')
