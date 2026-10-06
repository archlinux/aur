# Maintainer: Matthew Phillips <matthew@matthewphillips.info>
pkgname=augur-dbus
_name=augur
pkgver=0.2.1
pkgrel=1
pkgdesc='AI for desktop programs, as a session D-Bus service'
arch=('x86_64' 'aarch64')
url='https://github.com/matthewp/augur'
license=('BSD-3-Clause')
depends=('glib2' 'json-glib' 'libsoup3' 'glibc' 'dbus')
makedepends=('meson')
checkdepends=('python')
source=("$url/releases/download/v$pkgver/$_name-$pkgver.tar.xz")
sha256sums=('7a860b0b051ed58725c376bc75b0961adbfc6fff32e99fdc054c3eb2117c37d7')

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
