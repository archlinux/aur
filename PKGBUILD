# Maintainer: Spike29 <leguen.yannick@gmail.com>
# Contributor: Samir Faci <csgeek@archlinux.us>
# Contributor: TimothÃ©e Ravier <tim@siosm.fr>

pkgname='qxmpp'
pkgver='0.9.1'
pkgrel='1'
pkgdesc='Cross-platform C++ XMPP client and server library'
arch=('i686' 'x86_64')
url='https://github.com/qxmpp-project/qxmpp'
license=('LGPL2.1')
depends=('qt5-base')
optdepends=('doxygen: required to build the HTML documentation'
	    'opus: required to enable opus audio codec'
	    'speex: required to enable speex audio codec'
            'libvpx: required to enable vpx video codec'
	    'libtheora: required to enable theora video codec') 
conflicts=('qxmpp-qt5')
source=("${url}/archive/v${pkgver}.tar.gz")
sha1sums=('f3e4cdb4a5e8dfdf35485957d5030be1750cd829')
 
build() {
	cd "$srcdir/$pkgname-$pkgver/"
	[ -d build ] || mkdir build && cd build
	
	# In order to build the HTML documentation,
	# add QXMPP_USE_DOXYGEN=1 to qmake arguments

	# In order to enable opus & speex audio codecs, and vpx & theora video codecs,
	# add QXMPP_USE_OPUS=1, QXMPP_USE_SPEEX=1, QXMPP_USE_VPX=1 and QXMPP_USE_THEORA=1 to qmake arguments

	qmake-qt5 PREFIX=/usr ..
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	make INSTALL_ROOT="$pkgdir" install
}
