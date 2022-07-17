# Maintainer: Johannes Arnold <johannesarnold@stud.uni-hannover.de>
pkgname=xfwm4-rounded-corners
pkgver=4.16.1
pkgrel=1
epoch=
pkgdesc="Patch for Xfwm4 that allows drawing windows with rounded corners"
arch=('x86_64')
url="https://github.com/wsdfhjxc/xfwm-rounded-corners-patch"
license=('GPL2')
groups=()
depends=()
makedepends=('git' 'xfce4-dev-tools')
checkdepends=()
optdepends=()
provides=("xfwm4")
conflicts=("xfwm4")
replaces=()
backup=()
options=()
install=
changelog=
source=('git+https://github.com/xfce-mirror/xfwm4.git'
        'git+https://github.com/samueldy/xfce-patches.git')
noextract=()
md5sums=('SKIP'
         'SKIP')
validpgpkeys=()

prepare() {
	cd "$srcdir/xfce-patches"
	git checkout "rounded-corners-4.16.1"

	cd "$srcdir/xfwm4"
	git checkout "xfwm4-$pkgver"

	git apply "$srcdir/xfce-patches/xfwm4/xfwm4-$pkgver-rounded-corners.patch"
}

build() {
	cd "$srcdir/xfwm4"
	./autogen.sh --prefix=/usr
	make
}


check() {
	cd "$srcdir/xfwm4"
	make -k check
}

package() {
	cd "$srcdir/xfwm4"
	make DESTDIR="$pkgdir/" install
}
