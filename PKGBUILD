# Maintainer: Matthew Phillips <matthew@matthewphillips.info>
pkgname=augur-dbus
_name=augur
pkgver=0.1.0
pkgrel=1
pkgdesc='AI for desktop programs, as a session D-Bus service'
arch=('x86_64' 'aarch64')
url='https://github.com/matthewp/augur'
license=('BSD-3-Clause')
depends=('glib2' 'json-glib' 'libsoup3' 'glibc')
makedepends=('meson')
checkdepends=('python' 'dbus')
source=("$url/releases/download/v$pkgver/$_name-$pkgver.tar.xz")
sha256sums=('d99802014b4bf3f0a90e25c9833ada7512a2507395e8fa449613c812eb251c23')

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
