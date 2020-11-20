# Maintainer: Jonathon Fernyhough <jonathon+m2x@dev>

pkgname=hypnotix-git
pkgver=r18.2b0cc8e
pkgrel=1
pkgdesc="An IPTV app"
arch=(any)
url="https://github.com/linuxmint/hypnotix"
license=(unknown)
depends=(dconf hicolor-icon-theme lua51 python-imdbpy python-requests python-setproctitle mpv xapp)
makedepends=(git)
provides=(hypnotix)
conflicts=(hypnotix)
source=("git+$url.git")
b2sums=(SKIP)

pkgver() {
	cd ${pkgname/-git}
	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd ${pkgname/-git}
	make
}

package() {
	cd ${pkgname/-git}
	install -D     -t "$pkgdir"/usr/bin usr/bin/hypnotix
	install -D     -t "$pkgdir"/usr/lib/hypnotix usr/lib/hypnotix/{common,hypnotix}.py
	install -Dm644 -t "$pkgdir"/usr/lib/hypnotix usr/lib/hypnotix/mpv.py
	install -Dm644 -t "$pkgdir"/usr/share/applications usr/share/applications/hypnotix.desktop
	install -Dm644 -t "$pkgdir"/usr/share/glib-2.0/schemas usr/share/glib-2.0/schemas/org.x.hypnotix.gschema.xml
	install -Dm644 -t "$pkgdir"/usr/share/hypnotix usr/share/hypnotix/*.{css,png,ui}
	install -Dm644 -t "$pkgdir"/usr/share/hypnotix/pictures usr/share/hypnotix/pictures/*.svg
	install -Dm644 -t "$pkgdir"/usr/share/hypnotix/pictures/badges usr/share/hypnotix/pictures/badges/*
	install -Dm644 -t "$pkgdir"/usr/share/icons/hicolor/scalable/apps usr/share/icons/hicolor/scalable/apps/hypnotix.svg
}
