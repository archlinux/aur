# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Oscar Rainford <oscar@fourbs.com.au>
pkgname=openwebstart-bin
pkgver=1.6.0
pkgrel=1
epoch=
pkgdesc="An open source reimplementation of the Java Web Start technology."
arch=("x86_64")
url="https://openwebstart.com"
license=('GPL')
groups=()
depends=("java-runtime<18")
makedepends=()
checkdepends=()
optdepends=()
provides=("openwebstart")
conflicts=()
replaces=()
backup=()
options=(!strip !zipman)
install="openwebstart.install"
changelog=
source=(
	"https://github.com/karakun/OpenWebStart/releases/download/v1.6.0/OpenWebStart_linux_1_6_0.deb"
	"jnlp.xml"
	"javaws.desktop"
	"itw-settings.desktop"
)
md5sums=(
	"43de50969e877cb5b7e56a97da2e2cdd"
	"551218dd79f7600755d76ab733fdb5bc"
	"325214a1c96b12461190320cd2201bf7"
	"1443e7e283bbf7461e9829eeffd5966a"
)
validpgpkeys=()

package() {
	bsdtar -xf data.tar.gz -C "$pkgdir/"
	mkdir -p $pkgdir/usr/local/bin/
	mkdir -p $pkgdir/usr/share/applications/
	mkdir -p $pkgdir/usr/share/mime/packages/

	ln -sf "$pkgdir/opt/OpenWebStart/itw-settings" "$pkgdir/usr/local/bin/"
	ln -sf "$pkgdir/opt/OpenWebStart/javaws" "$pkgdir/usr/local/bin/"

	install -Dm644 jnlp.xml $pkgdir/usr/share/mime/packages
	install -Dm755 javaws.desktop $pkgdir/usr/share/applications
	install -Dm755 itw-settings.desktop $pkgdir/usr/share/applications
}


