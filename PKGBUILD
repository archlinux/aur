# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=battery-monitor-devel-git
pkgver=0.5.3.r34.gf7a83dd
pkgrel=7
pkgdesc='A utility tool, notifies user about charging, discharging and not charging state of the battery on Linux.'
arch=('any')
url="https://github.com/maateen/battery-monitor"
license=('GPL3')
depends=('acpi' 'python' 'python-gobject' 'libnotify' 'libappindicator-gtk3')
conflicts=('battery-monitor' 'battery-monitor-git')
provides=('battery-monitor')
source=("$pkgname"::'git+https://github.com/maateen/battery-monitor.git#branch=devel')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$pkgname"
	install -d "$pkgdir/"usr/{bin,share}/battery-monitor
	cp -a src/. "$pkgdir/usr/share/battery-monitor"
	install -Dm755 battery-monitor "$pkgdir/usr/bin/battery-monitor"
	install -Dm755 battery-monitor-autostart.desktop "$pkgdir/etc/xdg/autostart/battery-monitor-autostart.desktop"
	install -Dm755 battery-monitor.desktop "$pkgdir/usr/share/applications/battery-monitor.desktop"
}
