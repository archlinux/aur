# Patched by Alexey Korop. Original package info:
# $Id: PKGBUILD 205494 2014-02-06 05:24:01Z bisson $
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Partha Chowdhury <kira.laucas@gmail.com>

pkgname=conky-mt
ORIG=conky
pkgver=1.9.0
pkgrel=4
pkgdesc='Mouse-through conky based on /extra/conky package'
url='http://conky.sourceforge.net/'
license=('BSD' 'GPL')
arch=('i686' 'x86_64')
makedepends=('docbook2x')
conflicts=('conky')
provides=('conky')
depends=('glib2' 'curl' 'lua' 'wireless_tools' 'libxml2' 'libxft' 'libxdamage' 'imlib2')
source=("http://downloads.sourceforge.net/project/${ORIG}/${ORIG}/${pkgver}/${ORIG}-${pkgver}.tar.gz"
       'conky-mt.patch')
sha1sums=('a8d26d002370c9b877ae77ad3a3bbd2566b38e5d'
          'd9b97d64849f96c5b0cdc82506ddc44081f0c210')

backup=('etc/conky/'conky{,_no_x11}.conf)
options=('!emptydirs')

build() {
	cd "${srcdir}/${ORIG}-${pkgver}"
  patch -p1 < ../../conky-mt.patch

	CPPFLAGS="${CXXFLAGS}" LIBS="${LDFLAGS}" ./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--enable-ibm \
		--enable-curl \
		--enable-rss \
		--enable-weather-xoap \
		--enable-imlib2 \
		--enable-wlan \

	make
}

package() {
	cd "${srcdir}/${ORIG}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${ORIG}/LICENSE"
	install -Dm644 extras/vim/syntax/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/syntax/conkyrc.vim
	install -Dm644 extras/vim/ftdetect/conkyrc.vim "${pkgdir}"/usr/share/vim/vimfiles/ftdetect/conkyrc.vim
}
