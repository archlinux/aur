# Maintainer: Your Name <ryexander@gmail.com>
pkgname=silan
pkgrel=1
pkgver=0.3.2
pkgdesc="A standalone application to analyze audio files for silence and
print ranges of detected signals."
arch=('i686' 'x86_64')
url="https://github.com/x42/silan"
license=('GPL2')
depends=('libsndfile' 'ffmpeg')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
replaces=()
backup=()
options=()
install=
source=("https://github.com/x42/silan/archive/v${pkgver}.tar.gz")
noextract=()
md5sums=('2eb87b44732d2dcf6cc3e26b2105946b')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
  grep -rl 'AVCODEC_MAX_AUDIO_FRAME_SIZE' . | xargs  sed -i "s%AVCODEC_MAX_AUDIO_FRAME_SIZE%192000%g"
}

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
