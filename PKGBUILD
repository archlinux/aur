# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=btrfsd
pkgver=0.2.2
pkgrel=1
epoch=
pkgdesc="Tiny Btrfs maintenance daemon"
arch=(any)
url="https://github.com/ximion/btrfsd"
license=('LGPL-2.1')
groups=()
depends=(
	'json-glib'
	'systemd-libs'
	'btrfs-progs'
)
makedepends=(
	'docbook-xsl'
	'glib2-devel'
	'meson'
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!debug)
install=
changelog=
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/ximion/btrfsd/archive/refs/tags/v${pkgver}.tar.gz"
)
noextract=()
sha256sums=('3046f8397b70bd83d151fb856767af32f9145747f8bd5e238db5f8740d0ff348')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	mkdir build && cd build
	meson setup --buildtype=release --sysconfdir="/etc" --libexecdir="/usr/lib/${pkgname}" --mandir="/usr/share/man" ..
	ninja
}

package() {
	cd "$pkgname-$pkgver/build"
	DESTDIR="$pkgdir" ninja install
}
