# Maintainer: Jonathon Fernyhough <jonathon+m2x@dev>
# Contributor: Leo <olorin12+gmail+com>

pkgname=hypnotix
pkgver=1.7
pkgrel=1
pkgdesc="An IPTV streaming application"
arch=(any)
url="https://github.com/linuxmint/hypnotix"
license=(GPL3)
depends=(dconf hicolor-icon-theme python-cairo python-imdbpy python-requests python-setproctitle mpv xapp)
optdepends=('youtube-dl: YouTube channel support')
source=($url/archive/$pkgver.tar.gz)
b2sums=('7ae78c17e3e0abda52b361ab87930e11fed50adc9b6e84f20e72ef7d0ae30e53b642e3c89c68fba5db05f70afb0668fe35c8825a0075102c04dfb626a837616b')

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
