# Maintainer: Ikosse <andrelofgren@hotmail.co.uk>

pkgname=harbour-amazfish-git
pkgver=r849.34365e4
pkgrel=4
epoch=
pkgdesc="Companion application for Huami Devices and the Pinetime Infinitime"
arch=(x86_64 aarch64)
url="https://github.com/piggz/harbour-amazfish"
license=('AGPL3')
groups=()
depends=(
	'qt5-base'
	'karchive'
	'kdb'
	'kcontacts'
	'kcoreaddons'
	'qt5-location'
	'qt5-connectivity'
	'qtmpris'
	'nemo-qml-plugin-dbus'
	'kirigami2'
)
makedepends=('git')
checkdepends=()
optdepends=()
provides=('amazfish')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git+$url)
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git submodule init
	git submodule update
}

build() {
	cd "$srcdir/${pkgname%-git}"
	qmake FLAVOR=kirigami PREFIX=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make INSTALL_ROOT="$pkgdir" install
}
