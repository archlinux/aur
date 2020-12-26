# Maintainer: Frantic1048 <archer@frantic1048.com>
# Maintainer: Artem Klevtsov a.a.klevtsov@gmail.com

pkgname='pianobooster'
pkgdesc='A MIDI file player that teaches you how to play the piano'
pkgver=1.0.0
pkgrel=1
depends=('fluidsynth' 'ftgl' 'hicolor-icon-theme' 'qt5-base' 'rtmidi')
makedepends=('cmake' 'qt5-tools')
optdepends=('qt5-translations')
conflicts=('pianobooster-git')
replaces=('pianobooster-git')
arch=('x86_64')
url='https://www.pianobooster.org'
license=('GPL3')
source=("https://github.com/pianobooster/PianoBooster/archive/v${pkgver}.tar.gz")
sha512sums=('0ba67d97beffa9eebfc770b339daa7b7e213654eb84895556cd8d412ca7c47e9ffd1b01a7eefd3c81e0a6f56ad9b7da45b062209c10ad2380c2e59bdee4d01ac')

build () {
    cd "${srcdir}/PianoBooster-${pkgver}"
    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DUSE_SYSTEM_FONT=ON \
          -DUSE_JACK=ON \
          -DWITH_MAN=ON .
    make
}

package () {
    cd "${srcdir}/PianoBooster-${pkgver}"
    make -C build DESTDIR="${pkgdir}" install
}
