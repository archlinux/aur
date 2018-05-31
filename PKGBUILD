# Maintainer: Mark Wagie <yochanan.marqos@gmail.com>
pkgname=battery-monitor-devel
pkgver=0.5.3.r34.gf7a83dd
pkgrel=1
pkgdesc='A utility tool, notifies user about charging, discharging and not charging state of the battery on Linux.'
arch=('x86_64')
url="https://github.com/maateen/battery-monitor"
license=('GPL3')
depends=('python-gobject' 'python2-gobject' 'gtk3' 'libappindicator-gtk3' 'acpi' 'libnotify')
makedepends=('git')
conflicts=('battery-monitor')
provides=('battery-monitor')
source=("$pkgname"::'git+https://github.com/maateen/battery-monitor.git#branch=devel')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/${pkgname}"
	install -d "${pkgdir}/usr/share/battery-monitor"
	cp -a src/. "${pkgdir}/usr/share/battery-monitor"
	mkdir -p "${pkgdir}/usr/bin/battery-monitor"
	install -Dm755 battery-monitor "${pkgdir}/usr/bin/battery-monitor"
	install -Dm755 battery-monitor-autostart.desktop "${pkgdir}/etc/xdg/autostart/battery-monitor-autostart.desktop"
	install -Dm755 battery-monitor.desktop "${pkgdir}/usr/share/applications/battery-monitor.desktop"
}
