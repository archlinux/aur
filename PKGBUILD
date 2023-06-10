# Maintainer: jmcb <joelsgp@protonmail.com>

pkgname='parallels-client'
pkgver='19.2.23906'
# has an extra digit in the middle for some reason
_downloadver='19.2.0.23906'
pkgrel=2
pkgdesc="A remote work tool (rasclient, 2x RDP client, Parallels RAS)"
arch=('x86_64')
url="https://www.parallels.com/products/ras/capabilities/parallels-client/"
license=("custom:${pkgname}")
# from .deb control.tar.xz file
depends=('libxcursor'
         'zlib'
         'fontconfig'
         'libxrender'
         'glibc'
         'libxrandr'
         'libsm'
         'libxtst'
         'libice'
         'libxext'
         'libxi'
         'gcc'
         'alsa-lib'
         'alsa-plugins'
         'libxinerama'
         'libxft'
         'libx11'
         'pcsclite'
         'libcups'
         'libxpm'
         'libxml2'
         'libmtp'
         'libusb'
         'nas'
         'udisks2'
         # includes core, gui, widgets, network, xml, dbus, pritnsupport
         'qt5-base'
         'qt5-x11extras')
makedepends=()
optdepends=()
provides=()
conflicts=()
source=("https://download.parallels.com/ras/v${pkgver%%.*}/${_downloadver}/RASClient-${pkgver}_x86_64.tar.bz2")
noextract=()
sha256sums=('e37843a042f544bdebeccfb0a42ce1ffba30a0ee71d742493a44ee79fc554211')


package() {
    _suffix='opt/2X/Client'
    _src="${srcdir}/${_suffix}"
    _dest="${pkgdir}/${_suffix}"

    cd "${_src}"

    # TODO symlinks

    # binaries
    find 'bin/' -type f -exec install -D -t "${_dest}/bin" {} +

    #license
    install -D 'doc/EULA.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # share
    find 'share/' -type f -exec install -D -m644 -t "${_dest}/share" {} +
    find 'share/mime/' -type f -exec install -D -m644 -t "${_dest}/share/mime" {} +
    find 'share/sharedmimeinfo/' -type f -exec install -D -m644 -t "${_dest}/share/sharedmimeinfo" {} +

    # Fix udev symlink in /lib
    # install -dm755 "${pkgdir}/usr/lib/udev/rules.d"
    # mv "${pkgdir}/lib/udev/rules.d/90-rasusb.rules" "${pkgdir}/usr/lib/udev/rules.d/"
    # rm -rf "${pkgdir}/lib/"
}
