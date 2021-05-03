# Maintainer: Jason Goulet-Lipman <jason.gouletlipman@gmail.com>
pkgname=youtubedl-gui-beta
_pkgname=ytdl-gui
pkgver=latest
pkgrel=2
arch=('x86_64')
license=('GPL3')
pkgdesc="Download Youtube videos to local audio or video files. - Beta Branch"
source=("git+https://github.com/JaGoLi/$_pkgname#branch=beta")
md5sums=('SKIP')
provides=("youtubedl-gui")
conflicts=("youtubedl-gui")
makedepends=("git"
	     "qt5-quickcontrols"
	     "cmake")
depends=("youtube-dl"
	 "qt5-base"
	 "ffmpeg"
	 "hicolor-icon-theme")

pkgver(){
  	cd ${_pkgname}
  	printf "%s.r%s.%s" "$(TZ=UTC git show -s --pretty=%cd --date=format-local:%Y%m%d HEAD)" \
    	  "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${_pkgname}
	cmake -B build
	make -C build -j`nproc`
}

package() {
	cd ${_pkgname}
	make -C build DESTDIR="$pkgdir/" install
}
