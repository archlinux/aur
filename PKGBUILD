# Maintainer: Alex Ganin <alex at ganin dot tech>
# Maintainer: Andrew Shark <ashark at linuxcomp dot ru>
# Maintainer: Evandro Begati <evandroalb at gmail dot com>

pkgname=bitrix24
pkgver=23.0.32.91
pkgrel=2
pkgdesc="Bitrix24 unified workspace app (CRM, comms, tasks, and more)"
arch=("x86_64")
url="https://www.bitrix24.com/apps/desktop.php"
license=("custom")
source=("bitrix24_desktop-${pkgver}.deb::https://dl.bitrix24.com/b24/bitrix24_desktop.deb")
sha256sums=('fa3588cd11ea1234b70d2cf7f2774070397ef517f182bbab44bc01c9ac407071')

depends=(gtk3 libxss libappindicator-gtk3 nss alsa-lib libx11 glibc)

package() {
    tar -xf data.tar.xz -C "${pkgdir}"

    chmod -R a+rX "${pkgdir}"/opt/Bitrix24
    chmod -R a+rX "${pkgdir}"/usr/share/applications
    chmod -R a+rX "${pkgdir}"/usr/share/icons

    install -d "${pkgdir}/usr/bin"
    for _x in Bitrix24-web Bitrix24 BDisk; do
        ln -s "/opt/Bitrix24/$_x" "${pkgdir}/usr/bin/$_x"
    done
}
