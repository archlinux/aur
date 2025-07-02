# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Naglis Jonaitis <naglis@mailbox.org>
# Developer: Softemia <info@softemia.lt>

pkgname=mcard-toolbox
pkgver=1.4.0.0
pkgrel=1
pkgdesc="mCard Toolbox by Softemia (required for current Lithuanian ID cards)"
url="https://www.nsc.vrm.lt/downloads.htm"
arch=('x86_64')
license=('LicenseRef-Softemia') # The included license file only says the software is copyright by Softemia
license+=('BSL-1.0') # License for included Boost/CryptoPP code
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'openjpeg2' 'pcsclite' 'qt5-base')
makedepends=('patchelf')
source=("https://www.nsc.vrm.lt/files/Toolbox_LT-${pkgver}.zip")
sha256sums=('35b4a289484731f1ca86f3447816706a5ccb1c8344c6805b3a452c206d0e20d7')

package() {
   # Unpack the actual Fedora package contents
   bsdtar xf "${pkgname}-${pkgver}"-*fc*.rpm -C "${pkgdir}"

   # Move the license file to the correct place
   install -Dm644 "${pkgdir}/usr/share/${pkgname}/license.rtf" -t "${pkgdir}/usr/share/licenses/${pkgname}"
   rm -r "${pkgdir}/usr/share/${pkgname}"

   # Remove problematic RUNPATH entry
   patchelf --remove-rpath "${pkgdir}/usr/bin/${pkgname}"
}
