# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <jkraehemann@gmail.com>
pkgname=gsequencer
pkgver=1.4.34
pkgrel=1
pkgdesc="Advanced Gtk+ Sequencer"
arch=('x86_64' 'i386')
url="https://nongnu.org/gsequencer"
license=('GPL3')
depends=('pcre' 'ladspa' 'dssi' 'lv2' 'libsndfile' 'libsamplerate' 'libinstpatch' 'libpulse' 'gtk2')
checkdepends=() # 'cunit' 'xorg-server-xvfb'
provides=('gsequencer' 'midi2xml')
conflicts=('midi2xml')
source=("https://download.savannah.gnu.org/releases/gsequencer/1.4.x/$pkgname-$pkgver.tar.gz"
        "https://download.savannah.gnu.org/releases/gsequencer/1.4.x/$pkgname-alsa-default.patch")
noextract=()
md5sums=('1824ce22d64a5ee7ffcef9d37c74ca30' '65ec508f55ffc2fbab3cbe61276a3f8d')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	patch -p0 < "$srcdir/$pkgname-alsa-default.patch"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
#	xvfb-run --server-args "-screen 0 1920x1080x24" -a make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
