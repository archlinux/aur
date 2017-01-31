# Maintainer: Michele Cereda <cereda.michele@gmail.com>
# Contributor: JokerYu <dayushinn@gmail.com>, Olivier Bilodeau <obilodeau@gosecure.ca>

pkgname="forticlientsslvpn"
pkgver="4.4.2331"
pkgrel="2"
pkgdesc="Fortinet's SSLVPN Client for linux"
arch=("i686" "x86_64")
install="${pkgname}.install"

url="https://support.fortinet.com"
license=("custom:FortiClientSSLVPN")

depends=(
	"gtk2"
	"libsm"
	"net-tools"
	"ppp"
)
optdepends=(
	"gtk-engines: for gtk theme support"
	"gnome-themes-standard: for theming"
)

source=(
	"https://github.com/mcereda/forticlientsslvpn/raw/master/tarball/${pkgname}_linux_${pkgver}.tar.gz"
	"${pkgname}.desktop"
	"${pkgname}.png"
	"${pkgname}.sh"
	"${pkgname}_cli.sh"
)
sha256sums=(
	"c0affee5516d6426cf5bc7ac1f0d1c158fef02cb377817d4c5a917acab1b62bd"
	"4f63f4503dca7633a4d7a1cf874ede1f33f877a701813349c5cd63889151f4a2"
	"15d46db76a39f32736ee3a469fc1b821e6290453c701af823875a493d06901df"
	"5d4737629cadf38194ffc68d927a202cbac5f9fbcf825f11407c00e6a15842fb"
	"92f0dcc5431221d6832220b3ddec8d9606fff9ded4f8590eabd1c9ff3e37cb8b"
)


if   [ "$CARCH" = "i686"   ]; then _arch="32bit"
elif [ "$CARCH" = "x86_64" ]; then _arch="64bit"
fi

package() {
	msg "Creating folders..."
	mkdir -p ${pkgdir}/opt/fortinet/${pkgname}/icons
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/applications
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}

	msg "Copying files..."
	cp -rp ${srcdir}/${pkgname}/${_arch}/* ${pkgdir}/opt/fortinet/${pkgname}

	msg "Setting acceptable permissions..."
	chmod 555 ${pkgdir}/opt/fortinet/${pkgname}/helper

	msg "Installing files..."
	install -Dm 644 ${srcdir}/${pkgname}.png ${pkgdir}/opt/fortinet/${pkgname}/icons/
	install -Dm 644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/
	install -Dm 644 ${srcdir}/${pkgname}/${_arch}/helper/License.txt ${pkgdir}/usr/share/licenses/${pkgname}/
	
	msg "Installing launchers"
	# needed by the program since it checks that the executable is launched from /opt/fortinet/forticlientsslvpn/
	install -Dm 755 ${srcdir}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
	install -Dm 755 ${srcdir}/${pkgname}_cli.sh ${pkgdir}/usr/bin/${pkgname}_cli
}
