# Maintainer: David Lumaye <david at chindit dot be>

pkgname=frankenphp
pkgver=1.2.0
pkgrel=1
pkgdesc="FrankenPHP: Modern app server for PHP"
arch=('x86_64')
url="https://github.com/dunglas/frankenphp"
license=('MIT')
depends=()
makedepends=('php-embed' 'go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dunglas/frankenphp/archive/refs/tags/v$pkgver/frankenphp.tar.gz")
sha256sums=('f862a89b56fa96fc63adb80896579f609965516850504c26d695943925647853')

build() {
  cd "$srcdir"
  tar xzvf "$pkgname-$pkgver.tar.gz"
  cd "frankenphp-$pkgver/caddy/frankenphp/"
  CGO_CFLAGS=$(php-config --includes) CGO_LDFLAGS="$(php-config --ldflags) $(php-config --libs)" go build
}

package() {
  cd "$srcdir"
  install -Dm755 "frankenphp-$pkgver/caddy/frankenphp/frankenphp" "$pkgdir/usr/bin/frankenphp"
}
