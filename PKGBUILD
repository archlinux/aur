# $Id: PKGBUILD 205494 2014-02-06 05:24:01Z bisson $
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Partha Chowdhury <kira.laucas@gmail.com>

pkgname=conky-audacious
_pkgname=conky
pkgver=1.9.0
pkgrel=4
pkgdesc='Lightweight system monitor for X'
url='http://conky.sourceforge.net/'
license=('BSD' 'GPL')
arch=('i686' 'x86_64')
makedepends=('docbook2x')
provides=('conky')
conflicts=('conky')
depends=('glib2' 'curl' 'lua' 'wireless_tools' 'libxml2' 'libxft' 'libxdamage' 'imlib2' 'audacious' 'libaudclient')
source=("http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha1sums=('a8d26d002370c9b877ae77ad3a3bbd2566b38e5d')

backup=('etc/conky/'conky{,_no_x11}.conf)
options=('!emptydirs')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	CPPFLAGS="${CXXFLAGS}" LIBS="${LDFLAGS}" ./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--enable-ibm \
		--enable-curl \
		--enable-rss \
		--enable-weather-xoap \
		--enable-imlib2 \
		--enable-wlan \
		--enable-audacious
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm644 extras/vim/syntax/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/syntax/conkyrc.vim
	install -Dm644 extras/vim/ftdetect/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/ftdetect/conkyrc.vim
}
