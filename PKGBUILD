# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=dektec-dtepc
pkgver=2.13.1
pkgrel=1
pkgdesc='DekTec firmware update tool (DtEpc)'
arch=('x86_64')
url="https://www.dektec.com/downloads/utilities/"
license=('LicenseRef-custom')
depends=('dektec-drivers-dkms')
# Alternate version of the former dektec-utilities bundle (which shipped the
# same binary): pacman offers to remove the bundle when installing this.
conflicts=('dektec-utilities')
# DtEpc is distributed by DekTec as a prebuilt Linux binary only (no source
# published), so no -bin suffix is required. The binary is statically linked.
options=('!strip' '!debug')
# The outer zip contains a nested DtEpc_Linux_v<pkgver>.zip, which makepkg
# extracts automatically into $srcdir; prepare() unpacks that inner archive.
# The utility zips carry no license file, so the DekTec SDK license text is
# shipped in this repository (pinned by sha256 below).
source=("https://www.dektec.com/products/applications/DtEpc/downloads/DtEpc-${pkgver}.zip"
        'LICENSE.DekTec')
sha256sums=('4fbbfe09d55b3528a6a45bc6a2effce3ba0431d7ac141bf190423accc7c4a435'
            'e79e2afd3b10c50fb8c136dd43e6abf9dbf8c2e588f08e632d3c29d7e7228a0e')

prepare() {
  bsdtar -xf "${srcdir}/DtEpc_Linux_v${pkgver}.zip" -C "${srcdir}"
}

package() {
  install -Dm755 "${srcdir}/DtEpc64" "${pkgdir}/usr/bin/DtEpc"
  install -Dm644 "${srcdir}/LICENSE.DekTec" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
