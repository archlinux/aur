# Maintainer: Zajoe <zajoe223@gmail.com>
_pkgname=cctv-viewer
pkgname=${_pkgname}-git
pkgver=0.1.8
pkgrel=1
epoch=0
pkgdesc="A simple Qt application for simultaneously viewing multiple video streams. Designed for high performance and low latency. Based on ffmpeg."
arch=('any')
url="https://github.com/iEvgeny/cctv-viewer"
license=('GPL')
depends=('glibc' 
         'gcc-libs'
         'qt5-base'
         'qt5-translations'
         'qt5-svg'
         'ffmpeg'
         'qt5-multimedia'
         'qt5-quickcontrols'
         'qt5-quickcontrols2'
         'qt5-graphicaleffects'
	 'ttf-font')
makedepends=(git
            make
            cmake
            qt5-tools)
provides=(cctv-viewer)
source=('git+https://github.com/iEvgeny/cctv-viewer.git'
        'git+https://github.com/iEvgeny/qmlav.git')
sha1sums=('SKIP' 'SKIP')

prepare() {
    cd $_pkgname
    git submodule init    
    git config submodule.gmlav.url $srcdir/mysubmodule
    git submodule update
}

build() {
	cd $_pkgname
	cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release
	make
}


package(){      
  make DESTDIR="$pkgdir" -C "$srcdir/$_pkgname" install  
  cd "$pkgdir"
}

