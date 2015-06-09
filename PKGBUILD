##
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Maintainer: Todd Harbour <aur @AT@ quadronyx .DOT. org>
# Comments: 
# Binary version available from: http://www.quadronyx.org/aur/
##

pkgname=sidplay2-alsa
_pkgname=sidplay2
pkgver=2.0.9
pkgrel=2
pkgdesc="A commandline player for SID music files - ALSA version"
url="http://sidplay2.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
provides=('sidplay2')
conflicts=('sidplay2')
depends=(
	'sidplay2-libs'
	'alsa-lib'
	)
makedepends=(
	'pkgconfig'
	'autoconf'
	'automake'
	)
source=(
	http://downloads.sourceforge.net/sidplay2/sidplay-$pkgver.tar.gz
	config.guess.diff.gz
	${_pkgname}-gcc44.patch
	${_pkgname}-${pkgver}-alsa.patch
)
md5sums=(
	'8b0449e501ba8e684f718dce9b77c5a5'
        '3dbbf1e82c7712501cdbc814db31840e'
	'cd6e6e936793f25550bb579fa3f8c99d'
	'5689bb71fa5393c9ba984268edb3e1a2'
)
build() {
  cd "sidplay-${pkgver}"

  # Alsa patch, slightly modified version of: http://wnd.katei.fi/weblog/entry-41
  patch -Np1 -i "../${_pkgname}-${pkgver}-alsa.patch" || return 1
  patch -Np1 -i "../config.guess.diff" || return 1
  patch -Np0 -i "${srcdir}/${_pkgname}-gcc44.patch" || return 1

  ./configure	--prefix=/usr \
		--disable-static

  make || return 1
}

package() {
  cd "sidplay-${pkgver}"
  make DESTDIR="${pkgdir}" install
}


