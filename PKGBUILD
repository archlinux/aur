# Maintainer: Jonathon Fernyhough <jonathon+m2x@dev>
# Contributor: Leo <olorin12+gmail+com>

pkgname=hypnotix
pkgver=2.6
pkgrel=1
pkgdesc="An IPTV streaming application"
arch=(any)
url="https://github.com/linuxmint/hypnotix"
license=(GPL3)
depends=(dconf hicolor-icon-theme python-cairo python-gobject python-imdbpy python-requests python-setproctitle python-unidecode mpv xapp)
optdepends=('yt-dlp: YouTube channel support')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
b2sums=('36d0e029a2f23ccd209850383b0ab24ad36c2142b53131c32458dfc39b6842e82c6635ef54fb32adea543b30de2c83855cf005ad261058ca989f42e9f55abc19')

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
	install -Dm644 -t "$pkgdir"/usr/lib/hypnotix usr/lib/hypnotix/{mpv,xtream}.py
	install -Dm644 -t "$pkgdir"/usr/share/applications usr/share/applications/hypnotix.desktop
	install -Dm644 -t "$pkgdir"/usr/share/glib-2.0/schemas usr/share/glib-2.0/schemas/org.x.hypnotix.gschema.xml
	install -Dm644 -t "$pkgdir"/usr/share/hypnotix usr/share/hypnotix/*.{css,png,ui}
	install -Dm644 -t "$pkgdir"/usr/share/hypnotix/pictures usr/share/hypnotix/pictures/*.svg
	install -Dm644 -t "$pkgdir"/usr/share/hypnotix/pictures/badges usr/share/hypnotix/pictures/badges/*
	install -Dm644 -t "$pkgdir"/usr/share/icons/hicolor/scalable/apps usr/share/icons/hicolor/scalable/apps/hypnotix.svg

	# Translations
	cp -a usr/share/locale "$pkgdir"/usr/share/locale
}
