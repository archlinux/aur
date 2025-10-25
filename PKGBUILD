# Maintainer: Adam Cihelka <haziness_droop794@slmail.me>

pkgname=gowatch
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple terminal stopwatch, written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/buxxket/gowatch"
license=('GPL3')
depends=()
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/buxxket/gowatch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9b3793cc1ed91a2d98a207a9f24d05e8b64efb4e052e07b7f9ebbc3202c8c7aa')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build -o gowatch
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 gowatch "$pkgdir/usr/bin/gowatch"
  # If there's a default config, install it to /usr/share/gowatch/
  if [[ -f config.yaml.default ]]; then
    install -Dm644 config.yaml.default "$pkgdir/usr/share/$pkgname/config.yaml"
  fi
}
