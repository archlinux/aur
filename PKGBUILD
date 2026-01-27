# Maintainer: kmille github@androidloves.me

pkgname=signal-account-switcher
pkgver=0.1.0
pkgrel=3
pkgdesc="a simple tool to run multiple instances of signal-desktop"
arch=('x86_64')
url="https://github.com/kmille/signal-account-switcher"
license=('GPL-3.0-or-later')
makedepends=(go libxcursor libxrandr libxinerama libxi)
depends=(libxcb libx11 libglvnd)
source=("$url/archive/refs/tags/v$pkgver.tar.gz" "signal-account-switcher.desktop")
sha256sums=('7bf3c729f433335cdc64818a2bbc2c0b1dc31675c395aa7ac1bfb8377d12ee06'
            '24683d13d7f4291b1636c92d28b87fff02fcb24cba0f19c95e76d76a29b888fa')


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
  install -Dm755 "$pkgname-$pkgver/$pkgname" "$pkgdir"/usr/bin/$pkgname
  install -Dm755 "$srcdir/signal-account-switcher.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
