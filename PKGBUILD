# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# https://github.com/orhun/pkgbuilds

pkgname=stegify
pkgdesc="Tool for LSB steganography written in Go"
pkgver=1.2
pkgrel=2
arch=('x86_64')
url="https://github.com/DimitarPetrov/stegify"
license=('MIT')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('a2b0ff8dbe6d6f06d4239446b25fe149df15ea3d995cd2dad48130834c25faaffb1142f72e45bc50ad6d5e38cc48fb9f5652ec7dd6d796f67f33cdef13ada661')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go mod init github.com/DimitarPetrov/stegify
  go get github.com/DimitarPetrov/stegify/steg
  go build -o "$pkgname" .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
