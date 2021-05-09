# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Jason Goulet-Lipman <jason.gouletlipman@gmail.com>

pkgname=youtubedl-gui-git
pkgver=2.5.r3.g986b6a1
pkgrel=1
pkgdesc="Download Youtube videos to local audio or video files"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://github.com/JaGoLi/ytdl-gui"
license=(GPL3)
depends=(youtube-dl qt5-base ffmpeg)
makedepends=(git qt5-quickcontrols cmake)
provides=(youtubedl-gui)
conflicts=(youtubedl-gui)
source=("${pkgname%-git}::git+https://github.com/JaGoLi/ytdl-gui#branch=beta")
sha256sums=('SKIP')

pkgver(){
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  cmake -B build
  make -C build
}

package() {
  cd "${pkgname%-git}"
  make -C build DESTDIR="${pkgdir}/" install
}
