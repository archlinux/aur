# Maintainer: gbr <gbr@protonmail.com>
# Maintainer: masutu <masutu dot arch at gmail dot com>
pkgname=ezthumb
pkgver=3.6.2
pkgrel=1
pkgdesc='A video thumbnail generator based on ffmpeg.'
arch=('i686' 'x86_64')
url='https://sourceforge.net/projects/ezthumb/'
license=('GPL3')
depends=('ffmpeg2.8' 'gd' 'gtk2')
makedepends=('imagemagick')
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('a39803fbb97748170cdebf5fb0c56e08ab9b75e48e2527a302655b9021b288c0')

build() {
    cd "${pkgname}-${pkgver}"

    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --disable-debug-build \
        --with-gui=gtk2 \
        --with-x \
        LDFLAGS='-L/usr/lib/ffmpeg2.8' CPPFLAGS='-I/usr/include/ffmpeg2.8'

    make
    make gtkicons
}

package() {
    cd "${pkgname}-${pkgver}"

    for i in 16 22 24 32 48 128 256; do
        install -Dm644 "external/icons/${pkgname}${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
    done
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

# vim:set ts=4 sw=4 et:
