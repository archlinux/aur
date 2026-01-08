# Maintainer: Nocifer <apmichalopoulos at gmail dot com>

pkgname='exult'
pkgver=1.12.1
pkgrel=1
pkgdesc="A project to recreate Ultima 7 for modern operating systems, using the game's original plot, data, and graphics files"
arch=('x86_64')
url='https://exult.sourceforge.io'
license=('GPL-2.0-only')
depends=('fluidsynth' 'libogg' 'libvorbis' 'munt' 'sdl2_image')
optdepends=('timidity++: alternative to fluidsynth')
makedepends=('autoconf-archive')
source=("https://github.com/exult/exult/archive/refs/tags/v${pkgver}.tar.gz"
        'http://prdownloads.sourceforge.net/exult/exult_audio.zip')
b2sums=('a1b36226cc76155b790aad3a47aaa30717edb048ab4bc19f3a7ebb01cd47d42b71113d2d677e91c5e29fc599a6e133f25f493f6833dcd9d328a2f612248edc3c'
        'ad8a230d9ba92cef94b22b669644a10ae6fcfe92c4dbfc5c3f89535534b4bddfe7d9b69dbf05220033df92b6d172e83340e6571920f42b5e63e66a5417ffa8f4')

prepare() {
    cd exult-${pkgver}

    autoreconf -v -i

    ./configure --prefix=/usr --with-timidity='/etc/timidity/timidity.cfg'
}

build() {
    cd exult-${pkgver}

    make
}

package() {
    cd exult-${pkgver}

    make DESTDIR="$pkgdir" install

    install -dm755 "$pkgdir"/usr/share/exult/music
    install -Dm644 "$srcdir"/*.flx "$pkgdir"/usr/share/exult/
    install -Dm644 "$srcdir"/music/*.ogg "$pkgdir"/usr/share/exult/music
}
