# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=sshpilot
pkgname=${_pkgname}-bin
pkgver=4.4.4
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
sha512sums_x86_64=('e972bc79af4ddfd67c9cefb0a96cffda35bef40386ec55edf3d84865e41a67242a994dbbfd5305c4dc2d0f3f6dbf24c3950f955414796b4ac3f9410c636638f8'
                   '0b225440b59ee50017892c1ee0223135b7190e8db6651a997f01515e559d4adb4c77173296b885d329a1fa3ad155db3efb6e26b076ba206e642b5a21d310689a')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"

    patch -p1 < "${srcdir}/fix_desktop.patch"
}
