# Maintainer: gbr <gbr@protonmail.com>
# Maintainer: masutu <masutu dot arch at gmail dot com>
pkgname='ezthumb'
pkgver='3.6.7'
pkgrel=1
pkgdesc='A video thumbnail generator based on ffmpeg.'
arch=('i686' 'x86_64')
url='https://sourceforge.net/projects/ezthumb/'
license=('GPL3')
depends=('ffmpeg' 'gd' 'gtk2')
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('1d04a1521204b25454b8a2cedf4150df9c3c7d68059ed5742d03f7a30060674e')

build()
{
    cd "${pkgname}-${pkgver}"

    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --disable-debug-build \
        --with-gui=gtk2 \
        --with-x

    make
}

package()
{
    cd "${pkgname}-${pkgver}"

    install -Dm644 "external/icons/SMirC-thumbsup.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

# vim:set ts=4 sw=4 et:
