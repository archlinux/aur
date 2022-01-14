# Maintainer: mochaaP <aur@mochaa.ws>

_pkgname=CDNDrive-go # fix uppercase issue
pkgname=cdndrive-go
pkgver=0.9
pkgrel=1
pkgdesc='BiliDrive-compatible multi source downloader'
arch=($CARCH)
url="https://github.com/arm64v8a/CDNDrive-go"
license=('MIT')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('360fe6c4a9ed06a17b2349770dcf9a342f4904747b34c965f33f14d4bf802f06')

prepare(){
  cd "$_pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$_pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./...
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 build/CDNDrive "$pkgdir"/usr/bin/$pkgname
}
