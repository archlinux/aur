# Maintainer: Xavier (sapphirus at azorium dot net)
# Original Maintainer: Ossi Saukko <osaukko at gmail dot com>

_pkgbase=ocp
pkgname=${_pkgbase}-git
pkgver=0.2.102.r2.0065417
pkgrel=1
pkgdesc="Open Cubic Player (GIT Version)"
arch=('i686' 'x86_64')
url="https://stian.cubic.org/project-ocp.php"
license=('GPL')
install=${_pkgbase}.install

conflicts=(${_pkgbase})
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
	 'shared-mime-info'
	 'freetype2' 
	 'ttf-unifont' 
	 'libdiscid' 
	 'cjson'
	 'libancient')

makedepends=('git'
             'xa'
	     'desktop-file-utils')

source=(${_pkgbase}::git+https://github.com/mywave82/opencubicplayer.git)
md5sums=('SKIP')


pkgver() {
    	cd $_pkgbase
	echo "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

prepare() {
        cd $_pkgbase
	git submodule init
	git submodule update --init --recursive
}

build() {
  	cd $_pkgbase	
	./configure --prefix=/usr --sysconfdir=/etc --without-update-desktop-database --without-update-mime-database  --with-unifontdir=/usr/share/fonts/Unifont --with-unifont-ttf=/usr/share/fonts/Unifont/Unifont.ttf --with-unifont-csur-ttf=/usr/share/fonts/Unifont/Unifont_CSUR.ttf --with-unifont-upper-ttf=/usr/share/fonts/Unifont/Unifont_Upper.ttf		
	make DESTDIR="$pkgdir"
}

package() {
	cd $_pkgbase
	make DESTDIR="$pkgdir" install
}
