# Maintainer: Bobby Hamblin <hamblingreen@hotmail.com>
pkgname=dotool
pkgver=1.6
pkgrel=1
pkgdesc="Command to simulate input anywhere"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://git.sr.ht/~geb/dotool"
license=('GPL3')
makedepends=('go' 'libxkbcommon' 'scdoc')
source=("$url/archive/$pkgver.tar.gz" "dotoold.service")
sha512sums=('8a1439db938807574cafde61c6f68249e11cd7f5250db032d547629ed77cbe4e06e4fa6217c6ac823ed85b88d81c82a2172fd9456b938c9f7193a104d7c458ad'
            '81ea5294babc32a3d7df40ecebad50a5cb0fa0f94b054c60e9717e86721fe72c65db5f3e08d5af89fdeef1d71ec1ecf86fc19c9ed3b876eeb32aedd15556d2a2')

build() {
  cd "$pkgname-$pkgver"

  go build -ldflags "-X main.Version=$pkgver"
}

package() {
  cd "$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/lib/udev/rules.d/"
  mkdir -p "$pkgdir/usr/lib/systemd/user/"
  install -Dm755 dotool dotoolc dotoold "$pkgdir/usr/bin/"
  install -Dm644 "80-dotool.rules" "$pkgdir/usr/lib/udev/rules.d/80-dotool.rules"
  install -Dm644 "$srcdir/dotoold.service" "$pkgdir/usr/lib/systemd/user/dotoold.service"

  mkdir -p "$pkgdir/usr/share/man/man1"
  scdoc < doc/dotool.1.scd > "$pkgdir/usr/share/man/man1/dotool.1"

}

