# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=touchpad-indicator-git
pkgver=r102.ad2a9ae
pkgrel=1
epoch=1
pkgdesc="An indicator for the touchpad"
arch=('any')
url="https://github.com/atareao/Touchpad-Indicator"
license=('GPL3')
depends=('gtk3' 'gdk-pixbuf2' 'libappindicator-gtk3' 'libnotify' 'lsb-release' 'gconf' 'librsvg' 
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
	install -Dm755 "bin/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm644 debian/changelog "$pkgdir/usr/share/${pkgname%-git}/changelog"
	install -Dm755 src/*.py "$pkgdir/usr/share/${pkgname%-git}"
	install -d $pkgdir/usr/share/{touchpad-indicator/icons,glib-2.0/schemas}
	install -Dm644 data/icons/*.svg "$pkgdir/usr/share/${pkgname%-git}/icons"
	install -Dm644 data/schemas/*.xml $pkgdir/usr/share/glib-2.0/schemas
	install -Dm755 data/00_check_touchpad_status \
		$pkgdir/etc/pm/sleep.d/00_check_touchpad_status
	install -Dm755 data/00_check_touchpad_status_systemd \
		$pkgdir/usr/lib/systemd/system-sleep/00_check_touchpad_status_systemd
	install -Dm644 "data/${pkgname%-git}.desktop" \
		"$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
	install -Dm644 "data/${pkgname%-git}-autostart.desktop" \
		"$pkgdir/usr/share/${pkgname%-git}/${pkgname%-git}-autostart.desktop"
	install -Dm644 "data/icons/${pkgname%-git}.svg" \
		"$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname%-git}.svg"
	for icon_size in 8 16 32 48 96 128 192 256 512 1024; do
		icons_dir=/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
		install -d $pkgdir/$icons_dir
		install -Dm644 "data/icons/${icon_size}x${icon_size}/${pkgname%-git}.png" \
			"$pkgdir$icons_dir/${pkgname%-git}.png"
	done
	
	# Create languages directories
	
	_langpackdir=$pkgdir/usr/share/locale-langpack
	
	install -dm644 "$_langpackdir"/ar/LC_MESSAGES
	install -dm644 "$_langpackdir"/ast/LC_MESSAGES
	install -dm644 "$_langpackdir"/be/LC_MESSAGES
	install -dm644 "$_langpackdir"/ca/LC_MESSAGES
	install -dm644 "$_langpackdir"/cs/LC_MESSAGES
	install -dm644 "$_langpackdir"/de/LC_MESSAGES
	install -dm644 "$_langpackdir"/en_GB/LC_MESSAGES
	install -dm644 "$_langpackdir"/en/LC_MESSAGES
	install -dm644 "$_langpackdir"/es/LC_MESSAGES
	install -dm644 "$_langpackdir"/eu/LC_MESSAGES
	install -dm644 "$_langpackdir"/fi/LC_MESSAGES
	install -dm644 "$_langpackdir"/fr/LC_MESSAGES
	install -dm644 "$_langpackdir"/gl/LC_MESSAGES
	install -dm644 "$_langpackdir"/hr/LC_MESSAGES
	install -dm644 "$_langpackdir"/hu/LC_MESSAGES
	install -dm644 "$_langpackdir"/id/LC_MESSAGES
	install -dm644 "$_langpackdir"/it/LC_MESSAGES
	install -dm644 "$_langpackdir"/ja/LC_MESSAGES
	install -dm644 "$_langpackdir"/ka/LC_MESSAGES
	install -dm644 "$_langpackdir"/lt/LC_MESSAGES
	install -dm644 "$_langpackdir"/mn/LC_MESSAGES
	install -dm644 "$_langpackdir"/ms/LC_MESSAGES
	install -dm644 "$_langpackdir"/nl/LC_MESSAGES
	install -dm644 "$_langpackdir"/pl/LC_MESSAGES
	install -dm644 "$_langpackdir"/pt_BR/LC_MESSAGES
	install -dm644 "$_langpackdir"/pt/LC_MESSAGES
	install -dm644 "$_langpackdir"/ro/LC_MESSAGES
	install -dm644 "$_langpackdir"/ru/LC_MESSAGES
	install -dm644 "$_langpackdir"/si/LC_MESSAGES
	install -dm644 "$_langpackdir"/sk/LC_MESSAGES
	install -dm644 "$_langpackdir"/sr/LC_MESSAGES
	install -dm644 "$_langpackdir"/sv/LC_MESSAGES
	install -dm644 "$_langpackdir"/tr/LC_MESSAGES
	install -dm644 "$_langpackdir"/uk/LC_MESSAGES
	install -dm644 "$_langpackdir"/vi/LC_MESSAGES
	install -dm644 "$_langpackdir"/zh_CN/LC_MESSAGES
	install -dm644 "$_langpackdir"/zh_HK/LC_MESSAGES
	install -dm644 "$_langpackdir"/zh_TW/LC_MESSAGES

	# Compile languages
	
	msgfmt po/ar.po -o "$_langpackdir"/ar/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/ast.po -o "$_langpackdir"/ast/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/be.po -o "$_langpackdir"/be/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/ca.po -o "$_langpackdir"/ca/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/cs.po -o "$_langpackdir"/cs/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/de.po -o "$_langpackdir"/de/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/en_GB.po -o "$_langpackdir"/en_GB/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/en.po -o "$_langpackdir"/en/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/es.po -o "$_langpackdir"/es/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/eu.po -o "$_langpackdir"/eu/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/fi.po -o "$_langpackdir"/fi/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/fr.po -o "$_langpackdir"/fr/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/gl.po -o "$_langpackdir"/gl/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/hr.po -o "$_langpackdir"/hr/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/hu.po -o "$_langpackdir"/hu/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/id.po -o "$_langpackdir"/id/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/it.po -o "$_langpackdir"/it/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/ja.po -o "$_langpackdir"/ja/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/ka.po -o "$_langpackdir"/ka/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/lt.po -o "$_langpackdir"/lt/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/mn.po -o "$_langpackdir"/mn/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/ms.po -o "$_langpackdir"/ms/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/nl.po -o "$_langpackdir"/nl/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/pl.po -o "$_langpackdir"/pl/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/pt_BR.po -o "$_langpackdir"/pt_BR/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/pt.po -o "$_langpackdir"/pt/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/ro.po -o "$_langpackdir"/ro/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/ru.po -o "$_langpackdir"/ru/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/si.po -o "$_langpackdir"/si/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/sk.po -o "$_langpackdir"/sk/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/sr.po -o "$_langpackdir"/sr/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/sv.po -o "$_langpackdir"/sv/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/tr.po -o "$_langpackdir"/tr/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/uk.po -o "$_langpackdir"/uk/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/vi.po -o "$_langpackdir"/vi/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/zh_CN.po -o "$_langpackdir"/zh_CN/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/zh_HK.po -o "$_langpackdir"/zh_HK/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/zh_TW.po -o "$_langpackdir"/zh_TW/LC_MESSAGES/touchpad-indicator.mo
}
