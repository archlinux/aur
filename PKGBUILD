# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <jkraehemann@gmail.com>
pkgname=gsequencer
pkgver=1.4.27
pkgrel=1
epoch=
pkgdesc="Advanced Gtk+ Sequencer"
arch=('x86_64' 'i386')
url="http://nongnu.org/gsequencer"
license=('GPLv3+')
groups=()
depends=('pcre' 'ladspa' 'dssi' 'lv2' 'libsndfile' 'libsamplerate' 'libinstpatch' 'libpulse' 'gtk2')
makedepends=()
checkdepends=('cunit' 'xorg-server-xvfb')
optdepends=()
provides=('gsequencer' 'midi2xml')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://download.savannah.gnu.org/releases/gsequencer/1.4.x/$pkgname-$pkgver.tar.gz"
        "https://download.savannah.gnu.org/releases/gsequencer/1.4.x/$pkgname-$pkgver.patch")
noextract=()
md5sums=('b5d93a56d5885f294d87b7b5abd3172a' '64bbe83b2ad88c98bfbf08827da701db')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	patch -p0 < "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	xvfb-run --server-args "-screen 0 1920x1080x24" -a make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
