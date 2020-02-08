# Maintainer: Rodrigo Quelhas <rodrigo_quelhas@outlook.pt>

pkgname="barracudavpn"
pkgver="5.0.2.7"
pkgrel="1"
pkgdesc="Barracuda VPN Client for Linux"
arch=("i386" "x86_64")
install="${pkgname}.install"

url="https://campus.barracuda.com/product/networkaccessclient"
license=("custom:FortiClientSSLVPN")

depends=(
	"sh"
  "xterm"
)

source=(
  "https://raw.githubusercontent.com/RomarQ/barracudavpn-archlinux/master/tarball/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=('fb034907eed5a344ca324479df1e03652903c6b375bf506a6059fcac05a63113')

if   [ "$CARCH" = "i386"   ]; 
then 

  bin_location="usr/local/bin"
  bin_file="barracudavpn_32"

elif [ "$CARCH" = "x86_64" ];
then 

  bin_location="usr/bin"
  bin_file="barracudavpn_64"

fi
options=( !strip )

package() {
	msg "Creating folders..."
	mkdir -p ${pkgdir}/opt/${pkgname}/icons
  mkdir -p ${pkgdir}/usr/share/applications
	mkdir -p ${pkgdir}/${bin_location}

	msg "Installing files..."
  install -Dm 4755 ${srcdir}/${pkgname}/${bin_file} ${pkgdir}/${bin_location}/${pkgname}
	install -Dm 4755 ${srcdir}/${pkgname}/${pkgname}.png ${pkgdir}/opt/${pkgname}/icons/
	install -Dm 4755 ${srcdir}/${pkgname}/${bin_file}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
