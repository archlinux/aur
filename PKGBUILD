# Maintainer: Spike29 <leguen.yannick@gmail.com>
# Contributor: Samir Faci <csgeek@archlinux.us>
# Contributor: Timothée Ravier <tim@siosm.fr>

pkgname='qxmpp'
pkgver='0.7.5'
pkgrel='4'
pkgdesc='An XMPP client library based on Qt & C++'
arch=('i686' 'x86_64')
url='http://code.google.com/p/qxmpp/'
license=('LGPL2.1')
depends=('qt4>=4.5')
optdepends=('speex: required to enable speex audio codec'
            'libvpx: required to enable vpx video codec'
	    'libtheora: required to enable theora video codec') 
conflicts=('qxmpp-git' 'qxmpp-leechcraft-git')
source=("http://qxmpp.googlecode.com/files/$pkgname-$pkgver.tar.gz")
sha1sums=('184f658fa5b2e001f8fb24ad7c5bfa93ddfb2eb2')
 
build() {
	cd "$srcdir/$pkgname-$pkgver/"
	[ -d build ] || mkdir build && cd build
	qmake-qt4 PREFIX=/usr ..

	# In order to enable speex audio codec, vpx video codec or theora video codec,
	# add QXMPP_USE_SPEEX=1, QXMPP_USE_VPX=1 and QXMPP_USE_THEORA=1 to qmake arguments.

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	make INSTALL_ROOT="$pkgdir" install
}
