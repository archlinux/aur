# Maintainer: Clement Poisson <clement@poisson.me>
pkgname=kx3util
pkgver=1.16.6.25
pkgrel=2
epoch=
pkgdesc="Elecraft KX3 Utility"
arch=("x86_64")
url="http://www.elecraft.com/KX3/KX3_software.htm"
license=("custom")
groups=()
depends=("lib32-glibc" "lib32-libstdc++5" "lib32-gtk2")
makedepends=()
checkdepends=()
optdepends=()
provides=('kx3util')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.elecraft.com/software/KX3/KX3UtilityLINUX_1_16_6_25.tgz")
noextract=()
md5sums=('1c63b7f43b994ddf4f1c12add2cfaa36')
validpgpkeys=()

package() {

	# Desktop Entry
	install -Dm644 ../kx3util.desktop "${pkgdir}/usr/share/applications/kx3util.desktop"

	# License
	install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	cd "${srcdir}/kx3util_1_16_6_25"

	# Main Binary
	install -Dm755 kx3util "${pkgdir}/usr/local/bin/kx3util"

	# Libraries
	install -d "${pkgdir}/usr/local/lib/${pkgname}"
	install -Dm755 "kx3util Libs"/* "${pkgdir}/usr/local/lib/${pkgname}"
	# -- create a link to the expected install location
	ln -s "/usr/local/lib/${pkgname}" "${pkgdir}/usr/local/bin/kx3util Libs"

	# Help
	install -d "${pkgdir}/etc/${pkgname}/Help"
	# -- help files need world read in order to open in the browser
	install -Dm744 "Help"/* "${pkgdir}/etc/${pkgname}/Help"
	# -- create a link to the expected install location
	ln -s "/etc/${pkgname}/Help" "${pkgdir}/usr/local/bin/Help"
}
