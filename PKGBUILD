# Maintainer: Xavier (sapphirus at azorium dot net)
# Original Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>

_pkgbase=ocp
pkgname=${_pkgbase}
pkgver=0.2.102
pkgrel=2
pkgdesc="Open Cubic Player"
arch=('i686' 'x86_64')
url="https://stian.cubic.org/project-ocp.php"
license=('GPL')
install=${_pkgbase}.install

conflicts=(${_pkgbase}-git)
provides=(${_pkgbase}=${pkgver})


depends=('hicolor-icon-theme'
	 'libxxf86vm' 
	 'libxpm' 
	 'alsa-lib' 
	 'sdl2'
	 'flac'
	 'libvorbis'
	 'libmad'
	 'libjpeg-turbo' 
	 'libpng' 
	 'freetype2' 
	 'ttf-unifont' 
	 'libdiscid' 
	 'cjson'
	 'shared-mime-info'
	 'libancient')

makedepends=('git'
             'xa'
	     'desktop-file-utils')

source=(${_pkgbase}::git+https://github.com/mywave82/opencubicplayer.git#tag=v${pkgver})
md5sums=('SKIP')

prepare() {
        cd $_pkgbase
	git submodule init
	git submodule update --init --recursive	
	git merge 006541750261fe6b0a06a1792170719cca09d548 
}

build() {
  	cd $_pkgbase	
	./configure --prefix=/usr --sysconfdir=/etc --without-update-desktop-database --without-update-mime-database --with-unifontdir=/usr/share/fonts/Unifont --with-unifont-ttf=/usr/share/fonts/Unifont/Unifont.ttf --with-unifont-csur-ttf=/usr/share/fonts/Unifont/Unifont_CSUR.ttf --with-unifont-upper-ttf=/usr/share/fonts/Unifont/Unifont_Upper.ttf		
	make DESTDIR="$pkgdir"
}

package() {
	cd $_pkgbase
	make DESTDIR="$pkgdir" install
}
