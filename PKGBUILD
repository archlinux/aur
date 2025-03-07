# Maintainer: Wiktor Strzębała <wiktorek140@gmail.com>
# Contributor: Ryan O'Beirne <ryanobeirne@gmail.com>
pkgname=faustus-dkms-git
_pkgbase=faustus
pkgver=0.3
pkgrel=0
epoch=
pkgdesc="Experimental unofficial Linux platform driver module for ASUS TUF Gaming series laptops."
arch=("x86_64")
url="https://github.com/wiktorek140/faustus"
license=("GPL")
depends=("dkms")
makedepends=("git")
checkdepends=()
optdepends=("linux-headers" "linux-lts-headers" "linux-zen-headers")
provides=()
conflicts=("$_pkgbase" "${_pkgbase}-dkms")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/wiktorek140/faustus.git")
noextract=()
#sha256sums=("2b8ae62c8c05d0e72a31923512342f3c62e438215e69350fcbc082001d01a956")
sha256sums=("SKIP")

pkgver() {
	source "${srcdir}/${_pkgbase}/dkms.conf"
	echo "$PACKAGE_VERSION"
}

package() {
        cd ${srcdir}/${_pkgbase}
        mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}

		install -D <(printf 'blacklist %s\n' "asus_wmi" "asus_nb_wmi") "${pkgdir}/etc/modprobe.d/${_pkgbase}.conf"
		install -D <(printf '%s\n' "${_pkgbase}") "${pkgdir}/etc/modules-load.d/${_pkgbase}.conf"
}
