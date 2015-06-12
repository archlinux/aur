# Maintainer: Spike29 <leguen.yannick@gmail.com>
# Contributor: Samir Faci <csgeek@archlinux.us>
# Contributor: TimothÃ©e Ravier <tim@siosm.fr>

pkgname='qxmpp'
pkgver='0.8.3'
pkgrel='1'
pkgdesc='An XMPP client library based on Qt & C++'
arch=('i686' 'x86_64')
url='https://github.com/qxmpp-project/qxmpp'
license=('LGPL2.1')
depends=('qt4')
optdepends=('speex: required to enable speex audio codec'
            'libvpx: required to enable vpx video codec'
	    'libtheora: required to enable theora video codec') 
conflicts=('qxmpp-git' 'qxmpp-leechcraft-git' 'qxmpp-qt5' 'qxmpp-qt5-git')
source=("${url}/archive/v${pkgver}.tar.gz")
sha1sums=('63828a91be14b68ec6f091b30a292d47eaf7a3c0')
 
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
