# Maintainer: Matthew Phillips <matthew@matthewphillips.info>
pkgname=augur-dbus
_name=augur
pkgver=0.1.1
pkgrel=1
pkgdesc='AI for desktop programs, as a session D-Bus service'
arch=('x86_64' 'aarch64')
url='https://github.com/matthewp/augur'
license=('BSD-3-Clause')
depends=('glib2' 'json-glib' 'libsoup3' 'glibc')
makedepends=('meson')
checkdepends=('python' 'dbus')
source=("$url/releases/download/v$pkgver/$_name-$pkgver.tar.xz")
sha256sums=('78d32ae0f50d5554fcf46dffab8da00864d5a97516beacfec643f4b59b1d2e47')

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
