# Maintainer: Sýlvan Heuser <sylvan.heuser@gmx.net>
# Contributor: Joshua Ellis <josh@jpellis.me>

pkgname=cups-xerox-phaser-3600
pkgver=3.00.27+187
pkgrel=2
pkgdesc="CUPS driver for the Xerox Phaser 3600 series. Also supports fc2218, pe120, pe220, Phaser 3117, 3200, 3250, 3250, 3300, 3435, 3600, 6110, WorkCentre 3210, 3220, 4118"
url="http://www.support.xerox.com/support/phaser-3600/downloads/enus.html?operatingSystem=linux"
license=('custom')
arch=('i686' 'x86_64')
depends=('cups')
source=("http://download.support.xerox.com/pub/drivers/3600/drivers/linux/fr_CA/P3600.tar.gz")
sha256sums=('8622a96290080f86c4c3b002c1a6c82d2c4dc4ede0e383dc86d83b6e4a8064c2')

pkgver () {
  cd "${srcdir}/media/P3600/Linux/noarch/at_opt/share"
  echo $(cat VERSION-Printer_LINUX)+$(cat VERSION-BUILD)
}

prepare () {
  chmod -R u+w "${srcdir}"
}

package() {
    arch_dir="$CARCH"
    if [[ "$CARCH" == "i686" ]]; then
        arch_dir="i386"
    fi

    cd "${srcdir}/media/P3600/Linux"
    cp -a "${arch_dir}/at_root/usr" "${pkgdir}/"
    cp -a "${arch_dir}/at_opt/lib" "${pkgdir}/usr/"
    if [[ "$CARCH" == "x86_64" ]]; then
        mv "${pkgdir}"/usr/lib64/* "${pkgdir}/usr/lib/"
        rmdir "${pkgdir}/usr/lib64"
    fi
    mkdir -p ${pkgdir}/usr/share/cups/model
    cp -a noarch/at_opt/share/ppd/* ${pkgdir}/usr/share/cups/model/
    rm -rf ${pkgdir}/usr/sbin
}

# vim:set ts=2 sw=2 et:
