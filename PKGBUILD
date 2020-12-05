# Maintainer: Ramadan Ali <rot13ezqa@ezqa.ny>
_pkgname=abcccid
pkgname=${_pkgname}-bin
pkgver=2.0.2
pkgrel=2
pkgdesc="Binary AB Circle CCID driver for ABC USB CCID smart card readers"
arch=('x86_64')
url="https://abcircle.com/en/product/2/CIR115B/sim-sized-contact-smart-card-reader/"
license=('LGPL2.1+')
depends=("pcsclite>=1.8.3" "libusb>=1.0.9")
provides=("pcsc-ifd-handler" "${_pkgname}=${pkgver}")
conflicts=($_pkgname)
source=("Circle_Linux_Installer_v${pkgver}.zip::https://abcircle.com/download/11/b278d90be4b77c71b79e9a0c39415b9d3ebd2d242e041a63a378ebe67c68291e/Circle_Linux_Installer_v2.0.2.zip")
sha512sums=("17513c3bc993d05e81a8bcecf602d0dacc8e662c862fbaae9713108f3a0187eac7800a902a6b349ac49fdf3c08c6fa2e5f2d53a6e1a5c9e7150556b573386656")

prepare() {
	find ${srcdir} -type f -name lib${_pkgname}-${pkgver}*rpm -exec bsdtar -xf {} \;
	if [[ -e ${srcdir}/usr/lib ]]; then rm -rfv ${srcdir}/usr/lib; fi
	if [[ -e ${srcdir}/usr/lib64 ]]; then mv ${srcdir}/usr/lib64 ${srcdir}/usr/lib; fi
	if [[ -e ${srcdir}/etc/udev ]]; then mv ${srcdir}/etc/udev ${srcdir}/usr/lib/udev; fi
}

package() {
	mv  ${srcdir}/usr ${pkgdir}
}

