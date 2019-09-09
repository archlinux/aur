# Maintainer: robertfoster
# Contributor: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Frederic Bezies < fredbezies at gmail dot com>
# Contributor: Ian Brunelli (brunelli) <ian@brunelli.me>

pkgname=lollypop-git
pkgver=1.1.4.2.r1073.gb91d490c
pkgrel=1
pkgdesc='Music player for GNOME'
arch=(any)
url=https://gitlab.gnome.org/gnumdk/lollypop
license=(GPL)
depends=(
	appstream-glib
	gst-plugins-base-libs
	gtk3
	python-beautifulsoup4
	python-cairo
	python-gobject
	python-pillow
	totem-plparser
)
makedepends=(
	git
	gobject-introspection
	intltool
	itstool
	meson
)
optdepends=(
	'easytag: Modify tags'
	'gst-libav: FFmpeg plugin for GStreamer'
	'gst-plugins-bad: "Bad" plugin libraries'
	'gst-plugins-base: "Base" plugin libraries'
	'gst-plugins-good: "Good" plugin libraries'
	'gst-plugins-ugly: "Ugly" plugin libraries'
	'kid3-qt: Store covers in tags'
	'libsecret: Last.FM support'
	'python-pylast: Last.FM support'
	'youtube-dl: Youtube support'
)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+https://gitlab.gnome.org/World/${pkgname%-git}")

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	git describe --tags \
		| sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson lollypop build \
		--libexecdir='lib/lollypop'
	ninja -C build
}

package() {
	DESTDIR="${pkgdir}" ninja -C build install
}

md5sums=('SKIP')
