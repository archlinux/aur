# Maintainer: Bart Libert <aur@bart.libert.email>
pkgname=barracudavpn-bin
pkgver=5.2.2
pkgrel=2
pkgdesc="Barracuda VPN Client for Linux - needs original download from Barracuda"
arch=("i386" "x86_64")
conflicts=('barracudavpn')
provides=('barracudavpn')

url="https://campus.barracuda.com/product/networkaccessclient"
_download_url="http://dlportal.barracudanetworks.com/"
license=("custom:FortiClientSSLVPN")

_pkg_file_name="VPNClient_${pkgver}_Linux.tar.gz"

_DOWNLOADS_DIR=`xdg-user-dir DOWNLOAD`

if [ ! -f ${PWD}/${_pkg_file_name} ]; then
	if [ -f $_DOWNLOADS_DIR/${_pkg_file_name} ]; then
		ln -sfn $_DOWNLOADS_DIR/${_pkg_file_name} ${PWD}
	else
		msg2 ""
		msg2 "Package not found!"
		msg2 "The package can be downloaded here: ${_download_url} (needs account)"
		msg2 "Choose NAC / VPN Client -> Barracuda VPN Client ${pkgver} for Linux"
		msg2 "Please remember to put a downloaded package ${_pkg_file_name} into the build directory ${PWD} or $_DOWNLOADS_DIR"
		msg2 ""
	fi
fi

source=("local://${_pkg_file_name}")
sha256sums=('91459886ec634eca30321dc975de3208591084b2103801365442ef9c4e38e4ae')

options=(debug !strip)

prepare() {
    cd "${srcdir}"
    ar x barracudavpn_${pkgver}_amd64.deb data.tar.xz
    tar -xf data.tar.xz
}

package() {
    echo "${pkgdir}"
    install -Dm 4755 ${srcdir}/usr/local/bin/barracudavpn ${pkgdir}/usr/bin/barracudavpn
}
