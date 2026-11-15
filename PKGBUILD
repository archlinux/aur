# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=dektec-dtinfocl
pkgver=1.7.1
pkgrel=1
pkgdesc='DekTec command-line hardware information tool (DtInfoCL)'
arch=('x86_64')
url="https://www.dektec.com/downloads/utilities/"
license=('LicenseRef-custom')
depends=('dektec-drivers-dkms')
# Alternate version of the former dektec-utilities bundle (which shipped the
# same binary): pacman offers to remove the bundle when installing this.
conflicts=('dektec-utilities')
# DtInfoCL is distributed by DekTec as a prebuilt Linux binary only (no
# source published), so no -bin suffix is required. The binary is statically
# linked (verified with ldd: no shared library dependencies at all).
options=('!strip' '!debug')
# The zip extracts to Linux/DtInfoCL64 (handled automatically by makepkg).
# The zip carries no license file, so the DekTec SDK license text is shipped
# in this repository (pinned by sha256 below).
source=("https://www.dektec.com/products/applications/DtInfoCL/downloads/DtInfoCL_v${pkgver}.zip"
        'LICENSE.DekTec')
sha256sums=('df45c1330fc76f08576c6f8af4bad2c0a2ab872d3c325a356ac0eaf446c06d93'
            'e79e2afd3b10c50fb8c136dd43e6abf9dbf8c2e588f08e632d3c29d7e7228a0e')

package() {
  install -Dm755 "${srcdir}/Linux/DtInfoCL64" "${pkgdir}/usr/bin/DtInfoCL"
  install -Dm644 "${srcdir}/LICENSE.DekTec" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
