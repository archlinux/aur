# Maintainer: Matthew Phillips <matthew@matthewphillips.info>
pkgname=augur-dbus
_name=augur
pkgver=0.2.0
pkgrel=1
pkgdesc='AI for desktop programs, as a session D-Bus service'
arch=('x86_64' 'aarch64')
url='https://github.com/matthewp/augur'
license=('BSD-3-Clause')
depends=('glib2' 'json-glib' 'libsoup3' 'glibc' 'dbus')
makedepends=('meson')
checkdepends=('python')
source=("$url/releases/download/v$pkgver/$_name-$pkgver.tar.xz")
sha256sums=('1f16ea3fdeb44915a78d9bf1d295e0a0ef1c2c0f9102600296fdbff07af2f057')

build() {
	arch-meson "$_name-$pkgver" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "$pkgdir"
	install -Dm644 "$_name-$pkgver/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
