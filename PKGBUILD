# Maintainer: Amir Karimov <amirkarimov46@gmail.com>
pkgname=anicli-ru
pkgver=1.3.6
pkgrel=1
pkgdesc="Cli для просмотра аниме на русском языке."
arch=('any')
url='https://github.com/OMRIFIJI/anicli-ru'
license=('GPL3')
depends=('mpv' 'ffmpeg' 'libxml2')
makedepends=('go')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OMRIFIJI/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('af16a0a847b2f8df007f5e186f926b3c580425f123385125093a8dfb37437b7a')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o $pkgname ./cmd/anicli-ru/main_unix.go
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "./anicli-ru" "$pkgdir/usr/bin/$pkgname" 
}
