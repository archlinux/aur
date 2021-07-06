# Maintainer: silverhikari
pkgname=audacium-git
pkgver=78c701d.r1.gd032c3102
pkgrel=1
epoch=
pkgdesc="telemetry free version of audacity"
arch=(x86_64)
url="https://github.com/SartoxOnlyGNU/audacium"
license=('GPL2')
groups=()
depends=(alsa-lib libx11 gtk3 expat libid3tag libogg libsndfile libvorbis lilv lv2 portsmf suil libmad twolame vamp-plugin-sdk libsoxr soundtouch ffmpeg)
makedepends=(git cmake sdl2 libsoup libnotify gstreamer gst-plugins-bad-libs jack nasm conan)
checkdepends=()
optdepends=()
provides=('audacity')
conflicts=('audacity' 'audacity-git')
replaces=()
backup=()
options=()
install=
changelog=
source=('git+https://github.com/SartoxOnlyGNU/audacium')
md5sums=('SKIP')

pkgver() {
  cd "audacium"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "audacium"
	mkdir build && cd build
	cmake -G "Unix Makefiles" -Daudacity_use_ffmpeg=loaded -DCMAKE_INSTALL_PREFIX=/usr -DwxBUILD_TOOLKIT:STRING=gtk3 -DCMAKE_BUILD_TYPE=Release ..
	make
}

package() {
	cd "audacium"/build
	make DESTDIR="$pkgdir/" install
}
