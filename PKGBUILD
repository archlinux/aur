# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Kuklin István <kuklinistvan@zoho.com>
pkgname=anki-official-binary-bundle
pkgver=2.1.55
pkgrel=1
epoch=
pkgdesc="The official binary shipped with the tested versions of the dependent libraries."
arch=('x86_64')
url="https://apps.ankiweb.net"
license=('GNU AGPL')
groups=()
depends=('libxkbcommon-x11')
makedepends=()
checkdepends=()
optdepends=('mpv')
provides=('anki')
conflicts=('anki' 'anki-git')
replaces=()
backup=()
options=()
install=$pkgname.install
changelog=
topdirname="anki-$pkgver-linux-qt6"
source=(
  "https://github.com/ankitects/anki/releases/download/${pkgver}/${topdirname}.tar.zst"
  "install_sh.patch"
)
noextract=()
sha256sums=('7e2ede7d6059667a8e133b553a13ac7eca5c4c10f1ab0d91aff78018c1586c05'
            '991297cb02434d753f55980205a22971ed98655b0f62f0104ae4692155355d8c')

validpgpkeys=()

prepare() {
	cd "$srcdir"/"$topdirname"
	patch install.sh ../install_sh.patch
}

package() {
	cd "$topdirname"
	PREFIX="$pkgdir"/usr/ ./install.sh
}
