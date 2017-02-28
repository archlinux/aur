# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=cainteoir-engine
pkgver=0.12.2
pkgrel=1
epoch=
pkgdesc="The Cainteoir Text-To-Speach Engine"
arch=(x86_64)
url="https://github.com/rhdunn/cainteoir-engine"
license=('GPL')
groups=()
depends=()
makedepends=(python2-yaml)
checkdepends=()
optdepends=(pulseaudio alsa-lib libvorbis espeak svox-pico-bin poppler ffmpeg libavutil libavcodec libavformat libavresample)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
"https://github.com/rhdunn/cainteoir-engine/archive/$pkgname-$pkgver.tar.gz"
"https://github.com/rhdunn/ucd-tools/archive/8.0.0.tar.gz"
)
noextract=()
md5sums=(
063666a9f045d4b48572d887ed9f1264
f137401908b77c3175696feef2608abb
)
validpgpkeys=()

prepare() {
  cp -R ucd-tools-8.0.0/* "$pkgname-$pkgname-$pkgver/ucd-tools"
  sed -i 's/python/python2/g' "$pkgname-$pkgname-$pkgver/tools/fsm" 
}

build() {
	cd "$pkgname-$pkgname-$pkgver"
	./autogen.sh
  ./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgname-$pkgver"
	#make -k check
}

package() {
	cd "$pkgname-$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
  cd $pkgdir/usr/share
  rm -rf mime vim
}

