# Maintainer: MadPhysicist <jfoxrabinovitz at gmail dot com>
pkgname=kyocera-cups
pkgver=8.1601
pkgrel=1
pkgdesc='PPD drivers for Kyocera and UTAX TaskAlfa (TA) printers'
_rid=28992
arch=('i686' 'x86_64')
url="http://usa.kyoceradocumentsolutions.com/americas/jsp/Kyocera/resource_details.jsp?pid=25595&rid=${_rid}"
license=('custom')
groups=()
depends=('cups')
makedepends=()
optdepends=()
provides=()
conflicts=('kyocera-fs-c2x26mfp' 'kyocera-fs1128mfp' 'kyocera-fs1370dn' 'kyocera-ta266ci-cups')
replaces=()
backup=()
options=()
install=kyocera-cups.install
changelog=
source=("http://usa.kyoceradocumentsolutions.com/americas/jsp/upload/resource/${_rid}/0/Kyocera%20Linux%20PPD%20Ver%20${pkgver}.tar.gz")
noextract=()
sha1sums=('ad7adba5e29464e9c3c1f052c6899d54f5afe0f4')

prepare() {
    # Set number of bits: '32bit' or '64bit', depending on ${CARCH}
    if [ "${CARCH}" = "x86_64" ]; then
	    _bittage='64bit'
	    _suffix='amd64'
    else
	    _bittage='32bit'
	    _suffix='i386'
    fi

    # Set language name: Default is English
    # Valid options are: de, en, es, fr, it, pt
    # Options are result of `ls ${srcdir}/dist/KyoceraLinuxPackages/Global/${_bittage}`
    _language='en'

    cd "${srcdir}/dist/KyoceraLinuxPackages/Global/${_bittage}"

    # No additional depends since bsdtar can handle rpms:
    # http://unix.stackexchange.com/a/125703/79307
    bsdtar -xf "kyodialog3.${_language}_0.5-0_${_suffix}.rpm" -C ..
}

package() {
    # Install the package
    cp -r "${srcdir}/dist/KyoceraLinuxPackages/Global/usr" "${pkgdir}"

    # Install LICENSES
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 "${srcdir}/dist/KyoceraLinuxPackages/LICENSES.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.txt"
}
