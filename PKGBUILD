# Maintainer: Jason Goulet-Lipman <jason.gouletlipman@gmail.com>
pkgname=youtubedl-gui-beta
_pkgname=ytdl-gui
pkgver=20210125.r55.a274ddf
pkgrel=1
arch=('x86_64')
license=('GPL3')
pkgdesc="Download Youtube videos to local audio or video files. - Beta Branch"
source=("git+https://github.com/JaGoLi/$_pkgname#branch=beta")
install="youtubedl-gui.install"
md5sums=('SKIP')
conflicts=("youtubedl-gui")
makedepends=("git"
	     "qt5-quickcontrols")
depends=("youtube-dl"
	 "qt5-base"
	 "ffmpeg"
	 "hicolor-icon-theme"
	 "gtk-update-icon-cache")


pkgver(){
  	cd ${_pkgname}
  	printf "%s.r%s.%s" "$(TZ=UTC git show -s --pretty=%cd --date=format-local:%Y%m%d HEAD)" \
    	  "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${_pkgname}
	make build
}

package() {
	cd ${_pkgname}
	make DESTDIR="$pkgdir/" install
}
