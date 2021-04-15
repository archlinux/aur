# Maintainer: Jonathon Fernyhough <jonathon+m2x@dev>
# Contributor: Leo <olorin12+gmail+com>

pkgname=hypnotix
pkgver=1.6
pkgrel=1
pkgdesc="An IPTV streaming application"
arch=(any)
url="https://github.com/linuxmint/hypnotix"
license=(GPL3)
depends=(dconf hicolor-icon-theme python-cairo python-imdbpy python-requests python-setproctitle mpv xapp)
source=($url/archive/$pkgver.tar.gz)
b2sums=('632a697409fe0f734c8aff6b8d97e4be354eefdcf45d5f0981f87bb7c315ace17e5ee11d6d03533e87ad36a0f62bd29c44edd0f033dae730d3794354c379eb70')

prepare() {
	cd $pkgname-$pkgver
	sed -i "s/__DEB_VERSION__/$pkgver/g" usr/lib/hypnotix/hypnotix.py
}

build() {
	cd $pkgname-$pkgver
	make
}

package() {
	cd $pkgname-$pkgver
	install -D     -t "$pkgdir"/usr/bin usr/bin/hypnotix
	install -D     -t "$pkgdir"/usr/lib/hypnotix usr/lib/hypnotix/{common,hypnotix}.py
	install -Dm644 -t "$pkgdir"/usr/lib/hypnotix usr/lib/hypnotix/mpv.py
	install -Dm644 -t "$pkgdir"/usr/share/applications usr/share/applications/hypnotix.desktop
	install -Dm644 -t "$pkgdir"/usr/share/glib-2.0/schemas usr/share/glib-2.0/schemas/org.x.hypnotix.gschema.xml
	install -Dm644 -t "$pkgdir"/usr/share/hypnotix usr/share/hypnotix/*.{css,png,ui}
	install -Dm644 -t "$pkgdir"/usr/share/hypnotix/pictures usr/share/hypnotix/pictures/*.svg
	install -Dm644 -t "$pkgdir"/usr/share/hypnotix/pictures/badges usr/share/hypnotix/pictures/badges/*
	install -Dm644 -t "$pkgdir"/usr/share/icons/hicolor/scalable/apps usr/share/icons/hicolor/scalable/apps/hypnotix.svg

	# Translations
	cp -a usr/share/locale "$pkgdir"/usr/share/locale
}
