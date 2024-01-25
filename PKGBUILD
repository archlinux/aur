# Maintainer: Bobby Hamblin <hamblingreen@hotmail.com>
pkgname=dotool
pkgver=1.4
pkgrel=2
pkgdesc="Command to simulate input anywhere"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://git.sr.ht/~geb/dotool"
license=('GPL3')
makedepends=('go>=1.19' 'libxkbcommon' 'scdoc')
source=("$url/archive/$pkgver.tar.gz" "dotoold.service")
sha512sums=('9bf735365f6b5dd41473134cca1efaecf702b8733ca5026ac1b568ff4e2168c9120d35c3da5296002d16bd5d2af9910c0011a501d3628059f77221e3de51e362'
            '81ea5294babc32a3d7df40ecebad50a5cb0fa0f94b054c60e9717e86721fe72c65db5f3e08d5af89fdeef1d71ec1ecf86fc19c9ed3b876eeb32aedd15556d2a2')

build() {
  cd "$pkgname-$pkgver"

  go build -ldflags "-X main.Version=$pkgver"
}

package() {
  cd "$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/etc/udev/rules.d/"
  mkdir -p "$pkgdir/usr/lib/systemd/user/"
  install -Dm755 dotool dotoolc dotoold "$pkgdir/usr/bin/"
  install -Dm644 "80-dotool.rules" "$pkgdir/etc/udev/rules.d/80-dotool.rules"
  install -Dm644 "$srcdir/dotoold.service" "$pkgdir/usr/lib/systemd/user/dotoold.service"

  mkdir -p "$pkgdir/usr/share/man/man1"
  scdoc < doc/dotool.1.scd > "$pkgdir/usr/share/man/man1/dotool.1"

}

