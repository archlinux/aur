# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=touchpad-indicator-git
pkgver=r104.871c375
pkgrel=2
epoch=1
pkgdesc="An indicator for the touchpad"
arch=('any')
url="https://github.com/atareao/Touchpad-Indicator"
license=('GPL3')
depends=('gtk3' 'gdk-pixbuf2' 'libappindicator-gtk3' 'libnotify' 'lsb-release' 'librsvg'
         'python-xlib' 'python-pyudev' 'python-dbus' 'python-evdev' 'xorg-xinput')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/atareao/Touchpad-Indicator.git')
sha256sums=('SKIP')

pkgver() {
	cd "Touchpad-Indicator"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "Touchpad-Indicator"
	install -Dm755 "bin/${pkgname%-git}" -t "$pkgdir/usr/bin"
	install -Dm644 debian/changelog -t "$pkgdir/usr/share/${pkgname%-git}"
	install -Dm755 src/*.py "$pkgdir/usr/share/${pkgname%-git}"
	install -d $pkgdir/usr/share/{touchpad-indicator/icons,glib-2.0/schemas}
	install -Dm644 data/icons/*.svg "$pkgdir/usr/share/${pkgname%-git}/icons"
	install -Dm644 data/schemas/*.xml $pkgdir/usr/share/glib-2.0/schemas
	install -Dm755 data/00_check_touchpad_status -t "$pkgdir/etc/pm/sleep.d"
	install -Dm755 data/00_check_touchpad_status_systemd -t \
		"$pkgdir/usr/lib/systemd/system-sleep"
	install -Dm644 "data/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 "data/${pkgname%-git}-autostart.desktop" -t \
		"$pkgdir/usr/share/${pkgname%-git}"
	install -Dm644 "data/icons/${pkgname%-git}.svg" -t \
		"$pkgdir/usr/share/icons/hicolor/scalable/apps"
	for icon_size in 8 16 32 48 96 128 192 256 512 1024; do
		icons_dir=/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
		install -d $pkgdir/$icons_dir
		install -Dm644 "data/icons/${icon_size}x${icon_size}/${pkgname%-git}.png" -t \
			"$pkgdir$icons_dir"
	done

	# Create language directories

	_localedir=$pkgdir/usr/share/locale

	install -dm755 "$_localedir"/ar/LC_MESSAGES
	install -dm755 "$_localedir"/ast/LC_MESSAGES
	install -dm755 "$_localedir"/be/LC_MESSAGES
	install -dm755 "$_localedir"/ca/LC_MESSAGES
	install -dm755 "$_localedir"/cs/LC_MESSAGES
	install -dm755 "$_localedir"/de/LC_MESSAGES
	install -dm755 "$_localedir"/en_GB/LC_MESSAGES
	install -dm755 "$_localedir"/en/LC_MESSAGES
	install -dm755 "$_localedir"/es/LC_MESSAGES
	install -dm755 "$_localedir"/eu/LC_MESSAGES
	install -dm755 "$_localedir"/fi/LC_MESSAGES
	install -dm755 "$_localedir"/fr/LC_MESSAGES
	install -dm755 "$_localedir"/gl/LC_MESSAGES
	install -dm755 "$_localedir"/hr/LC_MESSAGES
	install -dm755 "$_localedir"/hu/LC_MESSAGES
	install -dm755 "$_localedir"/id/LC_MESSAGES
	install -dm755 "$_localedir"/it/LC_MESSAGES
	install -dm755 "$_localedir"/ja/LC_MESSAGES
	install -dm755 "$_localedir"/ka/LC_MESSAGES
	install -dm755 "$_localedir"/lt/LC_MESSAGES
	install -dm755 "$_localedir"/mn/LC_MESSAGES
	install -dm755 "$_localedir"/ms/LC_MESSAGES
	install -dm755 "$_localedir"/nl/LC_MESSAGES
	install -dm755 "$_localedir"/pl/LC_MESSAGES
	install -dm755 "$_localedir"/pt_BR/LC_MESSAGES
	install -dm755 "$_localedir"/pt/LC_MESSAGES
	install -dm755 "$_localedir"/ro/LC_MESSAGES
	install -dm755 "$_localedir"/ru/LC_MESSAGES
	install -dm755 "$_localedir"/si/LC_MESSAGES
	install -dm755 "$_localedir"/sk/LC_MESSAGES
	install -dm755 "$_localedir"/sr/LC_MESSAGES
	install -dm755 "$_localedir"/sv/LC_MESSAGES
	install -dm755 "$_localedir"/tr/LC_MESSAGES
	install -dm755 "$_localedir"/uk/LC_MESSAGES
	install -dm755 "$_localedir"/vi/LC_MESSAGES
	install -dm755 "$_localedir"/zh_CN/LC_MESSAGES
	install -dm755 "$_localedir"/zh_HK/LC_MESSAGES
	install -dm755 "$_localedir"/zh_TW/LC_MESSAGES

	# Compile languages

	msgfmt po/ar.po -o "$_localedir"/ar/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/ast.po -o "$_localedir"/ast/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/be.po -o "$_localedir"/be/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/ca.po -o "$_localedir"/ca/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/cs.po -o "$_localedir"/cs/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/de.po -o "$_localedir"/de/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/en_GB.po -o "$_localedir"/en_GB/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/en.po -o "$_localedir"/en/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/es.po -o "$_localedir"/es/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/eu.po -o "$_localedir"/eu/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/fi.po -o "$_localedir"/fi/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/fr.po -o "$_localedir"/fr/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/gl.po -o "$_localedir"/gl/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/hr.po -o "$_localedir"/hr/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/hu.po -o "$_localedir"/hu/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/id.po -o "$_localedir"/id/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/it.po -o "$_localedir"/it/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/ja.po -o "$_localedir"/ja/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/ka.po -o "$_localedir"/ka/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/lt.po -o "$_localedir"/lt/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/mn.po -o "$_localedir"/mn/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/ms.po -o "$_localedir"/ms/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/nl.po -o "$_localedir"/nl/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/pl.po -o "$_localedir"/pl/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/pt_BR.po -o "$_localedir"/pt_BR/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/pt.po -o "$_localedir"/pt/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/ro.po -o "$_localedir"/ro/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/ru.po -o "$_localedir"/ru/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/si.po -o "$_localedir"/si/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/sk.po -o "$_localedir"/sk/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/sr.po -o "$_localedir"/sr/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/sv.po -o "$_localedir"/sv/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/tr.po -o "$_localedir"/tr/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/uk.po -o "$_localedir"/uk/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/vi.po -o "$_localedir"/vi/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/zh_CN.po -o "$_localedir"/zh_CN/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/zh_HK.po -o "$_localedir"/zh_HK/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/zh_TW.po -o "$_localedir"/zh_TW/LC_MESSAGES/touchpad-indicator.mo
}
