# Maintainer: Fermín Olaiz <ferminolaiz@gmail.com>

pkgname=aerion
pkgver=0.2.3
pkgrel=4
pkgdesc="An Open Source Lightweight E-Mail Client"
arch=('x86_64')
url="https://aerion.3df.io"
license=('Apache-2.0')
depends=('at-spi2-core' 'cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'harfbuzz' 'libsoup3' 'pango' 'webkit2gtk-4.1' 'zlib')
makedepends=('go' 'wails')
provides=('aerion')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hkdb/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('54d40a98c2a18ab29daca3799b453b053e12e55236f98dd20e735410318aafec')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make build-linux
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make test
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 -t "$pkgdir/usr/bin/" build/bin/aerion
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -Dm644 build/linux/aerion.desktop "$pkgdir/usr/share/applications/io.github.hkdb.Aerion.desktop"
	install -Dm644 build/linux/aerion.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/io.github.hkdb.Aerion.png"
}
