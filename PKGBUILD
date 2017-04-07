# Maintainer: Michael Gisbers <michael@gisbers.de>
pkgname=flashprint
pkgver=3.16.0
pkgrel=1
pkgdesc="Slicer for the FlashForge 3D printers."
### no i686 link for version 3.16.0 available
#arch=('i686' 'x86_64')
arch=('x86_64')
url="http://www.ff3dp.com/"
depends=('qt5-base')
source_x86_64=("${pkgname}-${pkgver}_amd64.deb::http://www.ishare3d.com/3dapp/public/FlashPrint-ii/flashprint_3.16.0_amd64.deb" "flashprint")
#source_i686=("${pkgname}-${pkgver}_i686.deb::http://www.sz3dp.com/upfile/2017/01/03/20170103151329_822.deb" "flashprint")
md5sums_x86_64=('ca62ea6346f6d87b4f950da907ffa456'
                '1fa4e9abedbfb0fe9744986e2725d443')
sha256sums_x86_64=('f6bb2d4886d2ac8a3d9b3435b51b743e76a97a746d7ab8dedfcfd55ad607c66e'
                   'c981bd5d01b885ee952331f60a5545f1e667055f2c1fd0a37d9bb1d227bc281a')
sha512sums_x86_64=('1f2c93182d67858f6740dc2a9915a0e37cee5fc4db6414f28dac98fcc194a12a1eeaaecc83f34f9a2222c8a33fcd84807e45f60ce704ac8bb56a012fd6106594'
                   'e233d1f4eac6b69ecb43bbd2a7a18ded87896109d1e20b7e41cae76377bd16901fd8defa7d89225a958f2d80aa44de52d8a6533619a2fc237aaae056d971fe0f')
package() {
    cd ${pkgdir}
    tar -Jxvf ${srcdir}/data.tar.xz
    install -d ${pkgdir}/usr/bin
#    ln -s ../share/FlashPrint/FlashPrint ${pkgdir}/usr/bin/flashprint
    # workaround for render issues
    install ${srcdir}/flashprint ${pkgdir}/usr/bin/flashprint
    # patch desktop file, workaround for render issues
    sed -i "/^Exec=/ c Exec=/usr/bin/flashprint" ${pkgdir}/usr/share/applications/FlashPrint.desktop
}

