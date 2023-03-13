# Maintainer: Orphaned
# Contributor: Emil Miler <em@0x45.cz>
# Contributor: DaZ <daz.root+arch@gmail.com>

pkgname=slic3r-bin
pkgrel=6
pkgdesc='Open Source toolpath generator for 3D printers'
pkgver=1.3.0
arch=('x86_64')
url="http://www.slic3r.org"
conflicts=('slic3r' 'slic3r-git' 'slic3r-bin')
depends=('freeglut' 'glu' 'libpng12' 'perl' 'libxcrypt-compat' 'gtk2')
provides=('slic3r')
license=('AGPL3')
source=("https://github.com/slic3r/Slic3r/releases/download/${pkgver}/slic3r-${pkgver}-linux-x64.tar.bz2"
"slic3r.desktop")
sha256sums=('23761e32aca057de12e940fca097bcfef5a1efea9ff4998f8aa9fd58241db6dd'
'c37ae34717cd6245ee6bfea590345dbb772e39dfd4e2b48fe756d30bd00eca5a')

package() {
    install -d "${pkgdir}/opt"

    cp -R "${srcdir}/Slic3r" "${pkgdir}/opt/slic3r"

    find "${pkgdir}/opt/slic3r/" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgdir}/opt/slic3r/Slic3r"
    chmod 755 "${pkgdir}/opt/slic3r/perl-local"

    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/slic3r/Slic3r" "${pkgdir}/usr/bin/slic3r"

    install -d $pkgdir/usr/share/applications
    install -m 644 $srcdir/slic3r.desktop $pkgdir/usr/share/applications/
}

