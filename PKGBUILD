# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Kuklin István <kuklinistvan@zoho.com>
pkgname=anki-official-binary-bundle
pkgver=2.1.9
pkgrel=2
epoch=
pkgdesc="The official binary shipped with the tested versions of the dependent libraries."
arch=('x86_64')
url="https://apps.ankiweb.net"
license=('GNU AGPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=('anki')
conflicts=('anki-git')
replaces=()
backup=()
options=()
install=
changelog=
topdirname="anki-$pkgver-linux-amd64"
source=("https://apps.ankiweb.net/downloads/current/${topdirname}.tar.bz2" "remove_xdg_cmds_from_makefile.patch" "prefix-fix.patch")
noextract=()
md5sums=('8cc5bb80efc5dac2e9dc9ee802924e24' 'a7e473f132a4fecd9cb77ac9c8530f5f'
 '5968099e737668ad7134edfd8bc6f323')
validpgpkeys=()

prepare() {
	cd "$srcdir"
    patch -p0 -i remove_xdg_cmds_from_makefile.patch
    patch -p0 -i prefix-fix.patch
}

build() {
	cd "$topdirname"
	make
}

package() {
	cd "$topdirname"
	make PREFIX="$pkgdir/usr/" install
}
