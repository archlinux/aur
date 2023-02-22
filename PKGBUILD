# Maintainer: kmille github@androidloves.me

pkgname=signal-account-switcher
pkgver=0.1.0
pkgrel=2
pkgdesc="a simple tool to run multiple instances of signal-desktop"
arch=('x86_64')
url="https://github.com/kmille/signal-account-switcher"
license=('GPL3')
makedepends=(go libxcursor libxrandr libxinerama libxi)
depends=(libxcb libx11 libglvnd)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7bf3c729f433335cdc64818a2bbc2c0b1dc31675c395aa7ac1bfb8377d12ee06')


build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o $pkgname main.go
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
