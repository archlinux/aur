# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Kuklin István <kuklinistvan@zoho.com>
pkgname=anki-official-binary-bundle
pkgver=2.1.15
pkgrel=1
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
source=(
  "https://apps.ankiweb.net/downloads/current/${topdirname}.tar.bz2"
  "remove_xdg_cmds_from_makefile.patch"
  "prefix-fix.patch"
)
noextract=()
md5sums=(
    '257498db511b0caff35e64290b422176'
    '81e1cb8bfb5122319b141ea25e536ef6'
    '82a5d4f63bbc29e6a80043dd95973b4f'
)
validpgpkeys=()

prepare() {
	cd "$srcdir"
  ln -s "$topdirname" anki
  patch -p0 -i remove_xdg_cmds_from_makefile.patch
  patch -p0 -i prefix-fix.patch
  rm anki
}

build() {
	cd "$topdirname"
	make
}

package() {
	cd "$topdirname"
	make PREFIX="$pkgdir"/usr/ install
}
