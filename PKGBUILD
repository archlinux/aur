# Maintainer: Dario Spinnato <dario.spinnato07@gmail.com>
# Contributor: Julius Drodofsky <juliusdrodofsky@outlook.de>
pkgname='mines-tui'
pkgver=0.6.0
pkgrel=1
pkgdesc="A Terminal based Minesweeper implementation"
arch=(x86_64 i686 pentium4 armv7h aarch64)
url="https://github.com/Judro/mines"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
license=('BSD')
depends=(ncurses)
sha256sums=('479c5990a9592fa7316f25cdbd2d0863ae1db866ee7a064035a96d926b41e357')

prepare() {
	cd "$srcdir"
	patch --strip=1 < ../package.patch
}

build() {
	cd "$srcdir/mines-$pkgver"
	make
}

package() {
	cd "$srcdir/mines-$pkgver"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 deb/mines_0.5.1_amd64/usr/share/applications/mines.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 deb/mines_0.5.1_amd64/usr/share/icons/hicolor/128x128/apps/mines.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
	install -D bin/mines "$pkgdir/usr/bin/mines-tui"
}
