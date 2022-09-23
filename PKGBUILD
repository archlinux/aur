# Maintainer: Xavier (sapphirus at azorium dot net)
# Original Maintainer: Ossi Saukko <osaukko at gmail dot com>

_pkgbdir=opencubicplayer
pkgname=ocp-git
pkgver=0.2.99.r66.68249a1
pkgrel=1
pkgdesc="Open Cubic Player (GIT Version)"
arch=('i686' 'x86_64')
url="https://stian.cubic.org/project-ocp.php"
license=('GPL')
install=ocp.install

conflicts=('ocp')

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
	 'cjson')

makedepends=('git'
             'xa'
	     'desktop-file-utils')

source=("git+https://github.com/mywave82/opencubicplayer.git")
md5sums=('SKIP')

pkgver() {
    	cd $_pkgbdir
	echo "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

prepare() {
        cd $_pkgbdir
	git submodule init
	git submodule update --init --recursive
}

build() {
  	cd $_pkgbdir	
	./configure --prefix=/usr --sysconfdir=/etc --with-unifontdir=/usr/share/fonts/Unifont --with-unifont-ttf=/usr/share/fonts/Unifont/Unifont.ttf --with-unifont-csur-ttf=/usr/share/fonts/Unifont/Unifont_CSUR.ttf --with-unifont-upper-ttf=/usr/share/fonts/Unifont/Unifont_Upper.ttf		
	make DESTDIR="$pkgdir"
}

package() {
	cd $_pkgbdir
	make DESTDIR="$pkgdir" install
}
