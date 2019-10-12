# Maintainer: gbr <gbr@protonmail.com>
# Contributor: masutu <masutu dot arch at gmail dot com>
pkgname=ezthumb
pkgver=3.6.7
pkgrel=2
pkgdesc='A video thumbnail generator based on ffmpeg.'
arch=('i686' 'x86_64')
url='https://sourceforge.net/projects/ezthumb/'
license=('GPL3')
depends=('ffmpeg' 'gd' 'gtk2')
source=("${pkgname}-${pkgver}.tar.bz2::https://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
        'harfbuzz.patch')
sha256sums=('1d04a1521204b25454b8a2cedf4150df9c3c7d68059ed5742d03f7a30060674e'
            '25737e5e60c4f4e7ec7132db480b0166d4ecbd4b1b9bdd6b3e9fb75f691b2bbc')

prepare()
{
    cd "${pkgname}-${pkgver}"

    patch --forward --strip=1 --input="${srcdir}/harfbuzz.patch"
}

build()
{
    cd "${pkgname}-${pkgver}"

    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --disable-debug-build \
        --with-gui=gtk2 \

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
