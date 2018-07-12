# Maintainer: Mark Wagie <yochanan.marqos@gmail.com>
pkgname=battery-monitor
pkgver=0.6
pkgrel=4
pkgdesc='A utility tool, notifies user about charging, discharging and not charging state of the battery on Linux.'
arch=('x86_64')
url="https://github.com/maateen/battery-monitor"
license=('GPL3')
depends=('acpi' 'python' 'libnotify' 'libappindicator-gtk3')
conflicts=('battery-monitor')
provides=('battery-monitor')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('69169d19f98c71c6e76919651133f729')

package() {
	cd "$srcdir"/"$pkgname-$pkgver"
	install -d "${pkgdir}/usr/share/battery-monitor"
	cp -a src/. "${pkgdir}/usr/share/battery-monitor"
    mkdir "${pkgdir}/usr/bin"
	install -Dm755 battery-monitor "${pkgdir}/usr/bin"
	install -Dm755 battery-monitor-autostart.desktop "${pkgdir}/etc/xdg/autostart/battery-monitor-autostart.desktop"
	install -Dm755 battery-monitor.desktop "${pkgdir}/usr/share/applications/battery-monitor.desktop"
    echo "The binary has moved from /usr/bin/battery-monitor to /usr/bin. Please run "sudo rm -rf /usr/bin/battery-monitor" to remove the old binary"
}
