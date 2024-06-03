# Maintainer: David Lumaye <david at chindit dot be>

pkgname=frankenphp
pkgver=1.1.5
pkgrel=3
pkgdesc="FrankenPHP: Modern app server for PHP"
arch=('x86_64')
url="https://github.com/dunglas/frankenphp"
license=('MIT')
depends=()
makedepends=('php-embed' 'go')
source=("https://github.com/dunglas/frankenphp/archive/refs/tags/v$pkgver/frankenphp.tar.gz")
sha256sums=('9fb37c90a6019de9ecdec25e6a0c37d93e60a2bd03eb8a0a20994c2c6606196b')

build() {
  cd "$srcdir"
  tar xzvf "frankenphp.tar.gz"
  cd "frankenphp-$pkgver/caddy/frankenphp/"
  CGO_CFLAGS=$(php-config --includes) CGO_LDFLAGS="$(php-config --ldflags) $(php-config --libs)" go build
}

package() {
  cd "$srcdir"
  install -Dm755 "frankenphp-$pkgver/caddy/frankenphp/frankenphp" "$pkgdir/usr/bin/frankenphp"
}