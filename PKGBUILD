#Maintainer: DaZ <daz.root+arch@gmail.com> 
pkgname=slic3r-bin
pkgrel=1
pkgdesc="An STL-to-GCODE translator for RepRap 3D printers, aiming to be a modern and fast alternative to Skeinforge"
pkgver=1.2.9
_pkgver="1-2-9-stable"
arch=('i686' 'x86_64')
url=("http://www.slic3r.org")
conflicts=('slic3r' 'slic3r-git' 'slic3r-bin')
depends=('perl' 'libpng12')
provides=('slic3r')
license=('AGPL3')

if [ "$CARCH" = "i686" ]; then
    _arch='x86'
    md5sums=('29a6218bf9e275dce334b37d8bbbe5c4'
             '042b380323c81e7fef15c6907e4ed07f')
elif [ "$CARCH" = "x86_64" ]; then
    _arch='x86_64'

    md5sums=('b7858f87d9c2612cf46f3760e8dc9796'
            '042b380323c81e7fef15c6907e4ed07f')
fi

source=("http://dl.slic3r.org/linux/slic3r-linux-${_arch}-${_pkgver}.tar.gz"
        "slic3r.desktop")

package()
{
    install -d "${pkgdir}/opt"

    cp -R "${srcdir}/Slic3r" "${pkgdir}/opt/slic3r"

    find "${pkgdir}/opt/slic3r/" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgdir}/opt/slic3r/bin/slic3r"
    chmod 755 "${pkgdir}/opt/slic3r/lib/vrt/528ccea98cad02a5f453a7135f9ca183/"

    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/slic3r/bin/slic3r" "${pkgdir}/usr/bin/slic3r"

    install -d $pkgdir/usr/share/applications
    install -m 644 $srcdir/slic3r.desktop $pkgdir/usr/share/applications/
}
