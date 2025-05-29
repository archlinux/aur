# Maintainer: Alex Ganin <alex at ganin dot tech>
# Maintainer: Andrew Shark <ashark at linuxcomp dot ru>

pkgname=bitrix24
pkgver=17.0.17.84
pkgrel=1
pkgdesc="Messenger, task tracking and file sharing app for companies"
arch=("x86_64")
url="https://www.bitrix24.com/apps/desktop.php"
source=("https://dl.bitrix24.com/b24/bitrix24_desktop.deb")
sha256sums=("49f773b0aadedf43e30137e050d406e0bdb9a2965fbdf6441eb2382fe57e230a")

# TODO: check if deps listed here are needed, and if those listed in deb control file are missing here
depends=(
    "gtk3"
    "libnotify"
    "nss"
    "libxss"
    "alsa-lib"
    "libappindicator-gtk3"
)

package() {
    tar -C "${pkgdir}" -xf data.tar.xz

    # TODO: For astra linux, in deb postinst, they do this move. Check if it is needed.
    # mv -f /opt/Bitrix24/bxmp.so /opt/Bitrix24/libbxmp.so

    # As in deb postinst script
    chmod -R a+rX "${pkgdir}"/opt/Bitrix24
    chmod -R a+rX "${pkgdir}"/usr/share/applications
    chmod -R a+rX "${pkgdir}"/usr/share/icons/hicolor/128x128/apps
    chmod -R a+rX "${pkgdir}"/usr/share/icons/hicolor/apps

    # Custom changes (not from deb package).
    # Making symlinks in /usr/bin
    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin/"
    for _x in Bitrix24-web Bitrix24 BDisk
    do
      ln -s "/opt/Bitrix24/$_x" .
    done
}
