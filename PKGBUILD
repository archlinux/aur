# Maintainer: marzeq < marzeqmarzeq (at) gmail (dot) com >

pkgname=windigo
pkgver=0.2.1
pkgrel=1
pkgdesc="Lightweight Go-based daemon for Linux that controls fan speeds based on sensor input"
arch=("x86_64")
url="https://github.com/marzeq/windigo"
license=("MIT")
makedepends=("go" "git")
source=("git+https://github.com/marzeq/windigo.git#tag=v${pkgver}")
sha256sums=("SKIP")

build() {
  cd "$srcdir/$pkgname"
  go build -o windigo .
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 windigo "$pkgdir/usr/bin/windigo"
  ln -s windigo "$pkgdir/usr/bin/windigod"
  install -Dm644 windigod.service "$pkgdir/etc/systemd/system/windigod.service"
  install -Dm644 config.example.conf "$pkgdir/etc/windigo/config.example.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
