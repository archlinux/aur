# Maintainer:  nemesys <nemstar [at] zoho [dot] com>
# Contributor: randomize46 <randomize46 [at] gmail [dot] com>
# Contributor:  tjwoosta <tjwoosta@gmail.com>
# Contributor: Lucky <archlinux@builds.lucky.li>
# Contributor: Ashren <edgar [at] archlinux [dot] us>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Jeff Mickey <jeff@archlinux.org>

pkgname="rtorrent-vi-color"
_pkgname="rtorrent"
pkgver=0.9.4
pkgrel=2
pkgdesc='Ncurses BitTorrent client based on libTorrent with vi like keybindings and color patch.'
url="http://libtorrent.rakshasa.no"
arch=('i686' 'x86_64')
license=('GPL')
depends=("curl" "libtorrent=0.13.4" "xmlrpc-c" "libsigc++")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
install="${pkgname}.install"
source=("${url}/downloads/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}_vi_keybinding_tjwoosta.patch"
        "${_pkgname}-${pkgver}_color.patch")
sha1sums=('e997822e9b0d53cf8ecfb6b836e380065890e10d'
          'd35b53be6d1d5686c8a66ea821154e095e7a1556'
          '78429b5cf5976270dc1a55d8dc0ef4644675512b')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

  patch -uNp1 -i "${srcdir}/${_pkgname}-${pkgver}_vi_keybinding_tjwoosta.patch"
  patch -uNp1 -i "${srcdir}/${_pkgname}-${pkgver}_color.patch"

	export CXXFLAGS="${CXXFLAGS} -fno-strict-aliasing"
	./configure \
		--prefix=/usr \
		--disable-debug \
		--with-xmlrpc-c \

	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -D doc/rtorrent.rc "${pkgdir}"/usr/share/doc/rtorrent/rtorrent.rc
#  install -Dm644 doc/faq.xml "${pkgdir}/usr/share/doc/rtorrent/faq.xml"
#  install -Dm644 doc/rtorrent.1 "${pkgdir}/usr/share/man/man1/rtorrent.1"
#  install -Dm644 doc/rtorrent.rc "${pkgdir}/usr/share/doc/rtorrent/rtorrent.rc"

}
