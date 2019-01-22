# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=battery-monitor-devel-git
_gitname=battery-monitor
pkgver=0.5.3.r34.gf7a83dd
pkgrel=8
pkgdesc='A utility tool, notifies user about charging, discharging and not charging state of the battery on Linux.'
arch=('any')
url="https://github.com/maateen/battery-monitor"
license=('GPL3')
depends=('acpi' 'python' 'python-gobject' 'libnotify' 'libappindicator-gtk3')
provides=('battery-monitor')
source=('git+https://github.com/maateen/battery-monitor.git#branch=devel')
md5sums=('SKIP')

pkgver() {
 	cd "$srcdir/$_gitname"
 	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$_gitname"
	install -d "$pkgdir/"usr/{bin,share/battery-monitor}
	cp -a src/. "$pkgdir/usr/share/$_gitname"
	install -Dm755 "$_gitname" "$pkgdir/usr/bin/$_gitname"
	install -Dm644 "$_gitname-autostart.desktop" "$pkgdir/etc/xdg/autostart/$_gitname-autostart.desktop"
	install -Dm644 "$_gitname.desktop" "$pkgdir/usr/share/applications/$_gitname.desktop"
}
