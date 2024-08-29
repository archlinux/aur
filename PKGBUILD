# Maintainer: Bart Libert <aur@bart.libert.email>
pkgname=barracudavpn-bin
pkgver=5.3.5
pkgrel=1
pkgdesc="Barracuda VPN Client for Linux - needs original download from Barracuda"
arch=("i386" "x86_64")
conflicts=('barracudavpn')
provides=('barracudavpn')

url="https://campus.barracuda.com/product/networkaccessclient"
_download_url="http://dlportal.barracudanetworks.com/"
license=("LicenseRef-FortiClientSSLVPN")

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
sha256sums=('24cb39aa0a967c8e079945a718974588e7a34bc6820db679c27fe9acb3e1c098')

options=(debug !strip)

prepare() {
    cd "${srcdir}"
    ar x barracudavpn_${pkgver}_amd64.deb data.tar.zst
    tar -xf data.tar.zst
}

package() {
    echo "${pkgdir}"
    install -Dm 4755 ${srcdir}/usr/local/bin/barracudavpn ${pkgdir}/usr/bin/barracudavpn
}
