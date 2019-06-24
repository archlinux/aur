# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=touchpad-indicator-git
pkgver=r95.48ab61a
pkgrel=1
epoch=1
pkgdesc="An indicator for the touchpad"
arch=('any')
url="https://github.com/atareao/Touchpad-Indicator"
license=('GPL3')
depends=('gtk3' 'gdk-pixbuf2' 'libappindicator-gtk3' 'libnotify' 'lsb-release' 'gconf' 'librsvg' 'python-xlib' 'python-pyudev' 'python-dbus' 'python-evdev' 'xorg-xinput')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/atareao/Touchpad-Indicator.git#commit=48ab61aa6d74c96fa6150abc93fba8c6e4c896f0")
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
	install -Dm755 data/00_check_touchpad_status $pkgdir/etc/pm/sleep.d/00_check_touchpad_status
	install -Dm755 data/00_check_touchpad_status_systemd $pkgdir/usr/lib/systemd/system-sleep/00_check_touchpad_status_systemd
	install -Dm644 "data/${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
	install -Dm644 "data/${pkgname%-git}-autostart.desktop" "$pkgdir/usr/share/${pkgname%-git}/${pkgname%-git}-autostart.desktop"
	install -Dm644 "data/icons/${pkgname%-git}.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname%-git}.svg"
	for icon_size in 8 16 32 48 96 128 192 256 512 1024; do
		icons_dir=/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
		install -d $pkgdir/$icons_dir
		install -Dm644 "data/icons/${icon_size}x${icon_size}/${pkgname%-git}.png" "$pkgdir$icons_dir/${pkgname%-git}.png"
	done
	
	# Create languages directories
	mkdir -p $pkgdir/usr/share/locale-langpack/ar/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/ast/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/be/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/ca/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/cs/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/de/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/en_GB/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/en/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/es/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/eu/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/fi/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/fr/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/gl/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/hr/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/hu/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/id/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/it/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/ja/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/ka/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/lt/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/mn/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/ms/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/nl/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/pl/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/pt_BR/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/pt/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/ro/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/ru/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/si/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/sk/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/sr/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/sv/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/tr/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/uk/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/vi/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/zh_CN/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/zh_HK/LC_MESSAGES
	mkdir -p $pkgdir/usr/share/locale-langpack/zh_TW/LC_MESSAGES

	# Compile languages
	msgfmt po/ar.po -o $pkgdir/usr/share/locale-langpack/ar/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/ast.po -o $pkgdir/usr/share/locale-langpack/ast/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/be.po -o $pkgdir/usr/share/locale-langpack/be/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/ca.po -o $pkgdir/usr/share/locale-langpack/ca/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/cs.po -o $pkgdir/usr/share/locale-langpack/cs/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/de.po -o $pkgdir/usr/share/locale-langpack/de/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/en_GB.po -o $pkgdir/usr/share/locale-langpack/en_GB/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/en.po -o $pkgdir/usr/share/locale-langpack/en/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/es.po -o $pkgdir/usr/share/locale-langpack/es/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/eu.po -o $pkgdir/usr/share/locale-langpack/eu/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/fi.po -o $pkgdir/usr/share/locale-langpack/fi/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/fr.po -o $pkgdir/usr/share/locale-langpack/fr/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/gl.po -o $pkgdir/usr/share/locale-langpack/gl/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/hr.po -o $pkgdir/usr/share/locale-langpack/hr/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/hu.po -o $pkgdir/usr/share/locale-langpack/hu/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/id.po -o $pkgdir/usr/share/locale-langpack/id/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/it.po -o $pkgdir/usr/share/locale-langpack/it/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/ja.po -o $pkgdir/usr/share/locale-langpack/ja/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/ka.po -o $pkgdir/usr/share/locale-langpack/ka/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/lt.po -o $pkgdir/usr/share/locale-langpack/lt/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/mn.po -o $pkgdir/usr/share/locale-langpack/mn/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/ms.po -o $pkgdir/usr/share/locale-langpack/ms/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/nl.po -o $pkgdir/usr/share/locale-langpack/nl/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/pl.po -o $pkgdir/usr/share/locale-langpack/pl/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/pt_BR.po -o $pkgdir/usr/share/locale-langpack/pt_BR/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/pt.po -o $pkgdir/usr/share/locale-langpack/pt/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/ro.po -o $pkgdir/usr/share/locale-langpack/ro/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/ru.po -o $pkgdir/usr/share/locale-langpack/ru/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/si.po -o $pkgdir/usr/share/locale-langpack/si/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/sk.po -o $pkgdir/usr/share/locale-langpack/sk/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/sr.po -o $pkgdir/usr/share/locale-langpack/sr/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/sv.po -o $pkgdir/usr/share/locale-langpack/sv/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/tr.po -o $pkgdir/usr/share/locale-langpack/tr/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/uk.po -o $pkgdir/usr/share/locale-langpack/uk/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/vi.po -o $pkgdir/usr/share/locale-langpack/vi/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/zh_CN.po -o $pkgdir/usr/share/locale-langpack/zh_CN/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/zh_HK.po -o $pkgdir/usr/share/locale-langpack/zh_HK/LC_MESSAGES/touchpad-indicator.mo
	msgfmt po/zh_TW.po -o $pkgdir/usr/share/locale-langpack/zh_TW/LC_MESSAGES/touchpad-indicator.mo
}
