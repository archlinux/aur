# Maintainer: Laura Demkowicz-Duffy <dev at demkowiczduffy dot co dot uk>
_pkgname=bmputil
pkgname=${_pkgname}-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A tool for managing and flashing Black Magic Probe firmware"
arch=('x86_64')
url="https://codeberg.org/blackmagic-debug/bmputil"
license=('Apache-2.0 OR MIT')
depends=(glibc libgcc)
optdepends=("black-magic-debug-udev: udev rules for black magic probes")
provides=($_pkgname)
conflicts=($_pkgname)
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/$_pkgname-$CARCH-unknown-linux-gnu-v$pkgver.tar.xz"
		"$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8d45e8b6fa3155a6f4acaf7eb1c3bf87b41b8815d8ea7e6b9d843d33c3648460'
            '41e5897fa32cd8efcbd0c304da26ae808d0f785ccbce9a830764ccd67bf24a93')
noextract=("$_pkgname-$pkgver.tar.gz")

prepare() {
	mkdir -p "$_pkgname-$pkgver"
	bsdtar -xzf "$_pkgname-$pkgver.tar.gz" -C "$_pkgname-$pkgver" --strip-components=1
}

package() {
	install -Dm0755 "$_pkgname-$CARCH-unknown-linux-gnu-v$pkgver/$_pkgname-cli" "$pkgdir/usr/bin/$_pkgname-cli"
	install -Dm0644 "$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm0644 "$_pkgname-$pkgver/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
