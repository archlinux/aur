# Maintainer: Alex Ganin <alex at ganin dot tech>
# Maintainer: Andrew Shark <ashark at linuxcomp dot ru>
# Maintainer: Evandro Begati <evandroalb at gmail dot com>

pkgname=bitrix24
pkgver=24.0.38.92
pkgrel=1
pkgdesc="Bitrix24 unified workspace app (CRM, comms, tasks, and more)"
arch=("x86_64")
url="https://www.bitrix24.com/apps/desktop.php"
license=("custom")
source=("bitrix24_desktop-${pkgver}.deb::https://dl.bitrix24.com/b24/bitrix24_desktop.deb")
sha256sums=('a6c58013e8023c46762e6bc191375dd161647a3feae0571199f1747eb6d3b0fa')

depends=(alsa-lib at-spi2-core ca-certificates cairo curl dbus glib2 gtk3 libcups libx11 libxcb libxcomposite libxdamage libxext libxfixes libxkbcommon libxrandr libxss libxtst mesa nspr nss pango systemd-libs ttf-liberation vulkan-icd-loader wget xdg-utils libappindicator)

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
