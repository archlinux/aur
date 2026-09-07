# Maintainer: Pavel Khromov <pakhromov@gmail.com>

pkgname=mako-daemonless
pkgver=1.0.0
pkgrel=1
pkgdesc="Fork of mako (wayland notification daemon) with no background process, every notification is D-Bus activated"
arch=('x86_64')
url="https://github.com/pakhromov/mako-daemonless"
license=('MIT')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'pango' 'systemd-libs' 'wayland')
makedepends=('meson' 'ninja' 'scdoc' 'wayland-protocols')
provides=('mako')
conflicts=('mako')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('88c31ee84fe8d035e789fffabe1ddfefb221c3affe8ec1f2d20b21e2274e8925')

build() {
	meson setup --prefix=/usr --buildtype=plain -D werror=false \
		"$pkgname-$pkgver" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
	install -Dm644 "$pkgname-$pkgver/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
