# Maintainer: Kisaragi Hiu <mail@kisaragi-hiu.com>
# Contributor: David Lumaye <david at chindit dot be>

pkgname=frankenphp
pkgver=1.13.0
pkgrel=1
pkgdesc="The modern PHP app server"
arch=('x86_64')
url="https://frankenphp.dev"
license=('MIT')
depends=('php-embed')
makedepends=('go' 'watcher')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/php/frankenphp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6bcb8fdb414899cfb74e712c552771ec31cbe14d07ec767ce6a3aa671b54ab36')

build() {
	cd "frankenphp-${pkgver}/caddy/frankenphp/"
	CGO_CFLAGS=$(php-config --includes) CGO_LDFLAGS="$(php-config --ldflags) $(php-config --libs)" go build
}

package() {
	install -Dm755 "frankenphp-$pkgver/caddy/frankenphp/frankenphp" "$pkgdir/usr/bin/frankenphp"
}
