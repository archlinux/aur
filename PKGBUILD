# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=battery-monitor-devel-git
pkgver=0.5.3.r34.gf7a83dd
pkgrel=8
pkgdesc='A utility tool, notifies user about charging, discharging and not
        charging state of the battery on Linux.'
arch=('any')
url="https://github.com/maateen/battery-monitor"
license=('GPL3')
depends=('acpi' 'python' 'python-gobject' 'libnotify' 'libappindicator-gtk3')
provides=("${pkgname%-devel-git}")
conflicts=("${pkgname%-devel-git}")
source=('git+https://github.com/maateen/battery-monitor.git#branch=devel')
sha256sums=('SKIP')

pkgver() {
 	cd "$srcdir/${pkgname%-devel-git}"
 	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/${pkgname%-devel-git}"
	install -d "$pkgdir/"usr/{bin,share/battery-monitor}
	cp -a src/. "$pkgdir/usr/share/${pkgname%-devel-git}"
	install -Dm755 "${pkgname%-devel-git}" -t "$pkgdir/usr/bin"
	install -Dm644 "${pkgname%-devel-git}-autostart.desktop" -t \
		"$pkgdir/etc/xdg/autostart"
	install -Dm644 "${pkgname%-devel-git}.desktop" -t \
		"$pkgdir/usr/share/applications"
}
