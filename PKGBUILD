# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=sshpilot
pkgname=${_pkgname}-bin
pkgver=4.4.3
pkgrel=1
pkgdesc="SSH connection manager with integrated terminal, tunneling, tabbed interface and scp upload support."
arch=('x86_64')
url="https://github.com/mfat/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/mfat/${_pkgname}/v${pkgver}"
license=('GPL-3.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glib2' 'gtk4' 'gdk-pixbuf2' 'libsecret' 'pango' 'graphene' 'vte4' 'libadwaita' 'python' 'python-paramiko' 'python-cairo' 'python-gobject' 'python-keyring' 'python-psutil')

options=(!strip)

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}-${pkgrel}_all.deb"
               "fix_desktop.patch")
sha512sums_x86_64=('70cce478bd7040fcd943c542b6a53754965c68f00f96aeb50536164a6b59fe47db63010b283502e8098269984c456a98186f201e4997e14a079474d544f610ca'
                   '0b225440b59ee50017892c1ee0223135b7190e8db6651a997f01515e559d4adb4c77173296b885d329a1fa3ad155db3efb6e26b076ba206e642b5a21d310689a')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"

    patch -p1 < "${srcdir}/fix_desktop.patch"
}
