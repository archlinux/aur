# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
pkgname=6pm
pkgver=0.9
pkgrel=1
pkgdesc="A polyphonic, touch-sensitive, realtime, phase-modulation (PM) software synthesizer"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/mv-6pm/"
license=('GPL3')
groups=('pro-audio')
depends=('qt5-base' 'jack')
makedepends=('gcc')
source=("https://sourceforge.net/projects/mv-${pkgname}/files/${pkgname^^}_v${pkgver}.tgz")
sha512sums=('1866bc87a1fff8e1bbfbf783665c38e8f64faaa3c722560fad6fb51512e9ab78d42b9e2ce6755b26f87a82f7543261d8946d9178f6ce4a97e4b33a6d49999a77')

build() {
    cd "${srcdir}/${pkgname^^}_v${pkgver}/src"

#    rm ../build/*
    qmake -o ../build/Makefile
    make -s -C ../build
}

package() {
    cd "${srcdir}/${pkgname^^}_v${pkgver}"

    # Install executable
    install -d "${pkgdir}/usr/bin"
    install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin"

    # Install presets, midimaps, and documentation
    install -d "${pkgdir}/usr/share/${pkgname}/Presets"
    cp -Lpr Presets/* "${pkgdir}/usr/share/${pkgname}/Presets"

    install -d "${pkgdir}/usr/share/${pkgname}/MidiMaps"
    cp -Lpr MidiMaps/* "${pkgdir}/usr/share/${pkgname}/MidiMaps"

    install -d "${pkgdir}/usr/share/${pkgname}/Doc"
    cp -Lpr Doc/*EN.pdf "${pkgdir}/usr/share/${pkgname}/Doc"
}
