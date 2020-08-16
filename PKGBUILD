# Maintainer: Chris Cromer <chris@cromer.cl>

pkgname=faustus-rublag-dkms-git
_pkgname=faustus
pkgver=0.2
pkgrel=1
pkgdesc="Experimental unofficial Linux platform driver module for ASUS TUF Gaming series laptops with fan mode polling."
arch=("x86_64")
url="https://github.com/rublag/faustus"
license=("GPL")
depends=("dkms")
makedepends=("git")
conflicts=("faustus-dkms-git")
source=("git+https://github.com/hackbnw/faustus.git")
sha512sums=("SKIP")

pkgver() {
	source "${srcdir}/${_pkgname}/dkms.conf"
	echo "${PACKAGE_VERSION}"
}

package() {
	install -dm0755 "${pkgdir}/usr/src/${_pkgname}-${pkgver}"
	cp -r ${_pkgname}/* "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/

	install -D <(printf 'blacklist %s\n' "asus_wmi" "asus_nb_wmi") "${pkgdir}/etc/modprobe.d/${_pkgname}.conf"
	install -D <(printf '%s\n' "${_pkgname}") "${pkgdir}/etc/modules-load.d/${_pkgname}.conf"
}
