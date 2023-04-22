# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: nixi
# Contributor: Orphaned
# Contributor: Emil Miler <em@0x45.cz>
# Contributor: DaZ <daz.root+arch@gmail.com>
_pkgname=slic3r
pkgname="${_pkgname}-bin"
pkgver=1.3.0
pkgrel=8
pkgdesc="Open Source toolpath generator for 3D printers"
arch=('x86_64')
url="http://www.slic3r.org"
_githuburl="https://github.com/slic3r/Slic3r"
conflicts=("${_pkgname}" "${_pkgname}-git" "${_pkgname}-appimage")
depends=('freeglut' 'glu' 'libpng12' 'perl' 'libxcrypt-compat' 'gtk2' 'cairo' 'libglvnd' 'zlib' 'gcc-libs' 'xz' 'libxi' 'libjpeg-turbo'  \
    'pango' 'gdk-pixbuf2' 'expat' 'libx11' 'sh' 'glib2' 'libsm' 'openssl-1.0' 'hicolor-icon-theme' 'glibc' 'libxxf86vm')
makedepends=('gendesk')
provides=("${_pkgname}")
license=(AGPL3)
source=("${_pkgname}-${pkgver}.tar.bz2::${_githuburl}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-x64.tar.bz2")
sha256sums=('23761e32aca057de12e940fca097bcfef5a1efea9ff4998f8aa9fd58241db6dd')

package() {
    install -d "${pkgdir}/opt"
    cp -r "${srcdir}/Slic3r" "${pkgdir}/opt/slic3r"
    gendesk -f --pkgname "${_pkgname}" --pkgdesc "Open Source toolpath generator for 3D printers" --icon "${_pkgname}" \
        --categories "Utility;Development" --name "${_pkgname}" --exec "/opt/${_pkgname}/Slic3r"
    # Remove non-existing Symlink
    rm -rf "${pkgdir}/opt/slic3r/local-lib/lib/perl5/x86_64-linux-thread-multi/Alien/wxWidgets/gtk_3_0_2_uni/bin/wx-config"
    find "${pkgdir}" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgdir}/opt/${_pkgname}/Slic3r"
    chmod 755 "${pkgdir}/opt/${_pkgname}/perl-local"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
    install -Dm644 "${pkgdir}/opt/${_pkgname}/var/Slic3r_128px.png" -t "${pkgdir}/usr/share/icons/hicolor/128x128/apps/"
}