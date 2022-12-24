# Maintainer: Johannes Arnold <johannesarnold@stud.uni-hannover.de>
# Maintainer: Samuel Young <samueldy@umich.edu>
pkgname=xfwm4-rounded-corners
pkgver=4.18.0
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
	git checkout "rounded-corners-patch"

	cd "$srcdir/xfwm4"
	git checkout "xfwm4-$pkgver"

	git apply "$srcdir/xfce-patches/xfwm4/xfwm4-$pkgver-rounded-corners.patch"
}

build() {
	cd "$srcdir/xfwm4"

    # Match ./configure options from official xfwm4 package
	./autogen.sh \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--enable-startup-notification \
		--enable-randr \
		--enable-compositor \
		--enable-xsync \
		--disable-debug
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
