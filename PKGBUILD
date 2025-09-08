# Maintainer: Jakub Skowron <jakubskowron676@gmail.com>
pkgname=scolorpicker-legacy
pkgver=1.2.1
pkgrel=3
epoch=
pkgdesc="Legacy (C + X11-only) version of smooll's Color Picker"
arch=("x86_64")
url="https://github.com/smooll-d/scolorpicker/tree/legacy"
license=("0BSD")
groups=()
depends=("libx11" "xsel" "libxext")
makedepends=("cmake")
checkdepends=()
optdepends=()
provides=()
conflicts=("scolorpicker")
replaces=()
backup=()
options=(!debug)
install=
changelog=
source=("$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

#prepare() {
#	cd "$pkgname-$pkgver"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}

build() {
	cmake -S "$pkgname-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE="None" \
		-DINSTALL_SYSTEM_WIDE=YES
	cmake --build build
}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" $pkgname-$pkgver/LICENSE
}
