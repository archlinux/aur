# Maintainer: UnicornDarkness
# Contributor: Tom Kwok <contact@tomkwok.com>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: Benjamin Wild <benwild@gmx.de>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Joshua Stiefer <facedelajunk@gmail.com>

pkgname=exaile
pkgver=4.1.3
pkgrel=8
pkgdesc="A full-featured Amarok-style media player for GTK+"
arch=('any')
url="https://exaile.org"
license=('GPL-2.0-only')
depends=('python>=3.8'
	'python-bsddb'
	'gtk3>=3.24.0'
	'gst-python>=1.16.0'
	'gst-plugins-base>=1.16.0'
	'gst-plugins-base-libs'
	'gst-plugins-good>=1.16.0'
	'python-mutagen>=1.44.0'
	'python-dbus'
	'python-cairo'
	'python-gobject>=3.24.0'
	'gvfs'
	'pango'
	'hicolor-icon-theme'
	'libgirepository'
	'glib2'
	'gstreamer'
	'gdk-pixbuf2'
	'at-spi2-core')
makedepends=('pygobject-devel>=3.24.0' 'help2man')
checkdepends=('python-pytest'
	'python-sunau'
	'python-pipes')
optdepends=('udisks2: device detection'
	'python-discid: CD info'
	'python-musicbrainzngs: CD info / Musicbrainz covers'
	'spydaap: DAAP server'
	'python-zeroconf: DAAP plugins (daapserver and daapclient)'
	'python-pylast: Last.FM integration'
	'python-lxml: lyrics from lyricsmania.com (lyricsmania)'
	'python-feedparser: podcast plugin'
	'webkit2gtk: Wikipedia info'
	'libkeybinder3: Xlib-based hotkeys'
	'librsvg: scalable icons'
	'libnotify: native notifications'
	'streamripper: recording streams'
	'moodbar: moodbar plugin'
	'gst-plugins-bad: BPM Counter plugin'
	'python-beautifulsoup4: lyrics from lyrics.wikia.com (lyricwiki)'
	'ipython: ipconsole plugin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/exaile/exaile/archive/$pkgver.tar.gz"
	"0001-pipes.patch::https://github.com/exaile/exaile/commit/f37bb5e3ef33f05c12fd30fcbf38207498d7a909.patch"
	"0002-GIRepository-3.0.patch::https://github.com/exaile/exaile/commit/b503b4a5b500a8af20a3844ab308b7a49e681b75.patch")
sha512sums=('16b31331a31f0a2e088f177c8a01ef47603b07fe94cbb19869a4caeaec2da03cacaa07d5b0eb50052645449e07620e2c58f202007108af73e20cf744d70bb556'
            'a68f6632e61500a656fbf287f420814503cd6b9ac5c06fa7d8812e402ebc486cc72c19e1f18cb560999aee0b70e31f0aa47f9465d1006b596ea6a18ccd9c403e'
            '57b9bd7db01003e3f86ae5281664dfbea2b6ecffa950b55f13420c9fda74350a09306a473753c9bd1dbcb43583f82b75e5dcaf0c343769be75eee743045f16ee')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -Np1 -i ../0001-pipes.patch # https://aur.archlinux.org/packages/exaile#comment-1003707
	patch -Np1 -i ../0002-GIRepository-3.0.patch # https://aur.archlinux.org/packages/exaile#comment-1016606
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX="/usr"
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make PYTEST=py.test test
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir" install
}
