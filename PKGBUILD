# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=omniglass-git
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="touchpad gestures library based on evdev"
arch=('x86_64')
url="https://github.com/guarapicci/omniGlass"
license=('GPL-3.0-only')
groups=()
depends=("glibc"
	"libevdev"
	"lua51")
makedepends=("git"
	"cmake"
	"gcc")
checkdepends=()
optdepends=()
provides=("omniglass")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

prepare() {
# 	git clone $url.git "$pkgname-$pkgver"
	cd "$srcdir"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
	#use the build/install scripts included in the repository itself
}

build() {
	cd "$srcdir/omniGlass"

	cmake -S "." -B "output"\
	-DCMAKE_INSTALL_PREFIX="$pkgdir/usr"\
        -DCUSTOM_LIB_FOLDER="$pkgdir/usr/lib"\
        -DCUSTOM_CONFIG_FOLDER="$pkgdir/etc"\
        -DCUSTOM_EXEC_FOLDER="$pkgdir/usr/bin"\
        -DCUSTOM_INCLUDE_FOLDER="$pkgdir/usr/include";
        
	cd output
	cmake --build .
	#./configure --prefix=/usr
	#make
}

check() {
	cd "$srcdir"
	#make -k check
}

package() {
	cd "$srcdir/omniGlass/output"
	#cd output
	
	cmake --install .;
	#make DESTDIR="$pkgdir/" install
	#echo "installing to $pkgdir/"
}
