# Maintainer: Alexey Shpakovsky <alexey at shpakovsky dot ru>
pkgname=rofs-filtered
pkgver=1.7
pkgrel=1
epoch=
pkgdesc="A filtered read-only filesystem for FUSE"
arch=('x86_64')
url="https://github.com/gburca/rofs-filtered/"
license=('GPL2')
groups=()
depends=('fuse2')
makedepends=('cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=('etc/rofs-filtered.rc')
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/gburca/$pkgname/tar.gz/rel-$pkgver")
noextract=()
sha256sums=('d66066dfd0274a2fb7b71dd929445377dd23100b9fa43e3888dbe3fc7e8228e8')
validpgpkeys=()

prepare() {
	mkdir -p "$pkgname-rel-$pkgver/build"
}

build() {
	cd "$pkgname-rel-$pkgver/build"
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "$pkgname-rel-$pkgver/build"
	make DESTDIR="$pkgdir" install
	# move sample config file from /etc to docs dir
	mkdir -p "$pkgdir/usr/share/doc"
	mv "$pkgdir/usr/etc" "$pkgdir/usr/share/doc/$pkgname"
}
