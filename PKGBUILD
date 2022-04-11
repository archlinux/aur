# Maintainer: silverhikari
pkgname=audacium-git
pkgver=1.0.0.r56.ge9ea30102
pkgrel=2
epoch=2
pkgdesc="telemetry free version of audacity"
arch=(x86_64)
url="https://github.com/SartoxOnlyGNU/audacium"
license=('GPL2')
groups=()
depends=(alsa-lib libx11 gtk2 expat libid3tag libogg libsndfile libvorbis lilv lv2 portsmf suil libmad twolame vamp-plugin-sdk libsoxr soundtouch)
makedepends=(git cmake sdl2 libsoup libnotify gstreamer gst-plugins-bad-libs jack nasm conan)
optdepends=('ffmpeg4.4: additional imports and exports')
provides=('audacity')
conflicts=('audacity' 'audacity-git' 'tenacity')
source=('git+https://github.com/SartoxOnlyGNU/audacium')
md5sums=('SKIP')

export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'

pkgver() {
  cd "audacium"
  git describe --long --tags | sed 's/^v//;s/rel.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -B build -S "audacium" -G "Unix Makefiles" -Daudacity_use_ffmpeg=loaded -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
	make -C build
}

package() {
	cd build
	make DESTDIR="$pkgdir/" install
}
