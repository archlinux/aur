# Maintainer: UnicornDarkness
# Contributor: Tom Kwok <contact@tomkwok.com>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: Benjamin Wild <benwild@gmx.de>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Joshua Stiefer <facedelajunk@gmail.com>

pkgname=exaile
pkgver=4.2.1
pkgrel=1
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/exaile/exaile/archive/$pkgver.tar.gz")
sha512sums=('a43b49ecadc55973320676b7b6945edda0aa25ecd99026893f9de21c8952ff0d80ad460e9fc0ededebec1fcf50a330990c2a35a6a295926af4ae684309fe1232')

# prepare() {
# 	cd "$srcdir/$pkgname-$pkgver"
# 	patch -Np1 -i ../0001-xxx.patch
# }

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
