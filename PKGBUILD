# Maintainer: Robert Hamblin <hamblingreen@hotmail.com>
pkgname=dotool
pkgver=1.3
pkgrel=2
pkgdesc="Command to simulate input anywhere"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://git.sr.ht/~geb/dotool"
license=('GPL3')
makedepends=('go>=1.19')
source=("$url/archive/$pkgver.tar.gz")
sha512sums=('1f786c5769e7ddfc53c921a4920909632cbd4c2e89df7b6ba5f6b075345928f537f3b955ce034c2d2cf6a0512805fef17fa9ffc6a635d3e33257d03f3a57c9b9')

build() {
  cd "$pkgname-$pkgver"

  go build -ldflags "-X main.Version=$pkgver"
}

package() {
  cd "$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/etc/udev/rules.d/"
  install dotool dotoolc dotoold "$pkgdir/usr/bin/"
  install -Dm 0644 "80-dotool.rules" "$pkgdir/etc/udev/rules.d/80-dotool.rules"
}

