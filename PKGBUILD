# Maintainer: X0rg
# Contributor: Tom Kwok <contact@tomkwok.com>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: Benjamin Wild <benwild@gmx.de>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Joshua Stiefer <facedelajunk@gmail.com>

pkgname=exaile
pkgver=3.4.5
pkgrel=1
pkgdesc="A full-featured Amarok-style media player for GTK+"
arch=('any')
url="http://www.exaile.org"
license=('GPL2')
depends=('python2'
	'gstreamer0.10-python'
	'gstreamer0.10-good-plugins'
	'gstreamer0.10-base-plugins'
	'mutagen'
	'python2-dbus'
	'pygtk>=2.10'
	'librsvg'
	'desktop-file-utils')
makedepends=('make' 'help2man')
optdepends=('pycddb: CD metadata retrieval'
	'python2-bsddb: music collection support'
	'gstreamer0.10-bad-plugins: support for more formats'
	'gstreamer0.10-ugly-plugins: support for more formats'
	'gstreamer0.10-ffmpeg: support for more formats'
	'python2-beautifulsoup3: lyricwiki plugin'
	'python2-notify: notifyosd plugin'
	'notify-osd: notifyosd plugin'
	'webkitgtk2: contextinfo plugin'
	'pywebkitgtk: contextinfo plugin'
	'python2-pillow: Python Imaging Library (PIL) fork. Python2 version'
	'streamripper: streamripper plugin'
	'moodbar: moodbar plugin'
	'python2-mmkeys: XKeys plugin')
source=("https://github.com/exaile-dev/exaile/archive/$pkgver.tar.gz")
install=$pkgname.install
sha512sums=('9337b86ed2f6a13071615bd46a7a05a6564011a4e1fef4cb42925336864c07854cfe497d8defe65c4e287fd9546de6a51543180c5ce6a84525506e57209914be')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX="/usr"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir" install

	# fix for clicking files with spaces in names from nautilus
	sed -i "s#%u#%f#" "$pkgdir/usr/share/applications/exaile.desktop"
	sed -i "s|Exec=$pkgdir/*|Exec=/|" "$pkgdir/usr/share/dbus-1/services/org.exaile.Exaile.service"
}
