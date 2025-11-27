# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Naglis Jonaitis <naglis@mailbox.org>
# Developer: Softemia <info@softemia.lt>

_debpkg=mcard-toolbox-lt-amd64
pkgname=mcard-toolbox
pkgver=1.6.0.0
pkgrel=1
pkgdesc="mCard Toolbox by Softemia (required for current Lithuanian ID cards)"
url="https://www.nsc.vrm.lt/downloads.htm"
arch=('x86_64')
license=('LicenseRef-Softemia') # The formerly included license file only says the software is copyright by Softemia
license+=('BSL-1.0') # License for included Boost/CryptoPP code
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'openjpeg2' 'openssl' 'pcsclite' 'qt5-base')
makedepends=('patchelf')
source=("https://www.nsc.vrm.lt/files/Toolbox_LT-${pkgver}.zip")
sha256sums=('ebaaab120e09960a8259bfc13313ae1774a72b9d1099bae9157fe34f8ec4a5ed')

package() {
   # Unpack the actual Debian package contents
   mkdir "${_debpkg}" || true
   bsdtar xf "${_debpkg}".deb -C "${_debpkg}"
   bsdtar xf "${_debpkg}"/data.tar.zst -C "${pkgdir}"

   # Remove problematic RUNPATH entry
   patchelf --remove-rpath "${pkgdir}/usr/bin/${pkgname}"
}
