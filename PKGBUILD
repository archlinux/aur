# Maintainer: Benjamin Klettbach <b dot klettbach at gmail dot com >
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: ArcticVanguard <LideEmily at gmail dot com>
# Contributor: ledti <antergist at gmail dot com>

pkgname=obs-studio-git
pkgver=0.15.4.r33.g07539da
pkgrel=1
pkgdesc="Free and open source software for video recording and live streaming."
arch=("i686" "x86_64")
url="https://github.com/jp9000/obs-studio"
license=("GPL2")
depends=("ffmpeg" "jansson" "libxinerama" "libxkbcommon-x11"
         "qt5-x11extras" "curl" "hicolor-icon-theme")
makedepends=("cmake" "git" "libfdk-aac" "libxcomposite" "x264" "jack" "vlc")
optdepends=("libfdk-aac: FDK AAC codec support"
            "libxcomposite: XComposite capture support"
            "jack: JACK Support"
            "vlc: VLC Media Source")
provides=("obs-studio")
conflicts=("obs-studio")
install=$pkgname.install
source=("$pkgname::git+https://github.com/jp9000/obs-studio.git#branch=master")
md5sums=("SKIP")

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r "s/([^-]*-g)/r\1/;s/-/./g"
}

build() {
  cd $pkgname

  mkdir -p build; cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
	-DOBS_VERSION_OVERRIDE=$pkgver ..

  make
}

package() {
  cd $pkgname/build

  make install DESTDIR="$pkgdir"
}

# vim: ts=2:sw=2
