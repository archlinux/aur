# Maintainer: Luna Jernberg <droidbittin@gmail.com>
# Contributor: Sam Burgos <santiago.burgos1089@gmail.com>
# Contributor: Jonathon Fernyhough <jonathon+m2x@dev>
# Contributor: Leo <olorin12+gmail+com>
# Contributor: Daniel Menelkir <menelkir@gmail.com>
pkgname=hypnotix-git
pkgver=3.2.r2.g0d28083
pkgrel=1
pkgdesc="An IPTV streaming application"
arch=(any)
url="https://github.com/linuxmint/hypnotix"
license=(GPL3)
depends=(dconf hicolor-icon-theme python-cairo python-gobject python-imdbpy python-requests python-setproctitle python-unidecode mpv xapp)
optdepends=('yt-dlp: YouTube channel support')
makedepends=(git)
provides=(hypnotix)
conflicts=(hypnotix)
source=("git+$url.git")
b2sums=(SKIP)

pkgver() {
	cd ${pkgname/-git}
	git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd ${pkgname/-git}
	sed -i "s/__DEB_VERSION__/$pkgver/g" usr/lib/hypnotix/hypnotix.py
	make
}

package() {
	cd ${pkgname/-git}
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
