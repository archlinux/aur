# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Thomas Girod <tgirod@altu.fr>
_pkgname=overwitch
pkgname=overwitch-git
pkgver=r250.9ceb911
pkgrel=1
epoch=
pkgdesc="JACK client for Overbridge devices"
arch=('x86_64')
url="https://github.com/dagargo/overwitch"
#https://github.com/dagargo/overwitch/archive/refs/tags/0.2.tar.gz
license=('GPL')
groups=()
depends=('libusb' 'jack' 'libsamplerate')
makedepends=('make' 'autoconf')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('git+https://github.com/dagargo/overwitch.git#commit=9ceb9117e6a363d2234a66bce1246b8dec1e9e73')
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$_pkgname"
}

build() {
	cd "$_pkgname"
	autoreconf --install
	./configure --prefix=/usr
	make
}

check() {
	cd "$_pkgname"
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
	mkdir -p $pkgdir/usr/lib/udev/rules.d/
	cp udev/*.rules $pkgdir/usr/lib/udev/rules.d/
	mkdir -p $pkgdir/usr/lib/udev/hwdb.d/
	cp udev/*.hwdb $pkgdir/usr/lib/udev/hwdb.d/
}

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
