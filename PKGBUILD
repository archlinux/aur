# Maintainer: X0rg
# Contributor: Tom Kwok <contact@tomkwok.com>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: Benjamin Wild <benwild@gmx.de>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Joshua Stiefer <facedelajunk@gmail.com>

pkgname=exaile
pkgver=3.4.4
pkgrel=1
pkgdesc="A full-featured Amarok-style media player for GTK+"
arch=('any')
url="http://www.exaile.org"
license=('GPL')
depends=('python2'
	'gstreamer0.10-python'
	'gstreamer0.10-good-plugins'
	'gstreamer0.10-base-plugins'
	'mutagen'
	'python2-dbus'
	'pygtk>=2.10'
	'librsvg')
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
	'moodbar: moodbar plugin')
source=(https://github.com/exaile-dev/exaile/archive/$pkgver.tar.gz)
install=$pkgname.install
sha512sums=('414f3b2844882d0ab483fabf556b4281ac44ab2328c4adf4202384bc1aaa1a0d230aebdf026982d4edd9a0aff42cd0d317785051b5d740734b670d1fe84aff13')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make PREFIX=/usr
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install

	# fix for clicking files with spaces in names from nautilus
	sed -i "s#%u#%f#" "${pkgdir}/usr/share/applications/exaile.desktop"
	sed -i "s|Exec=$pkgdir/*|Exec=/|" "${pkgdir}/usr/share/dbus-1/services/org.exaile.Exaile.service"
}
