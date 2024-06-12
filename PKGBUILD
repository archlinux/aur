# Maintainer: Gary Wang <git@blumia.net>

pkgname=pineapple-midi-player
pkgver=1.2.0
pkgrel=1
pkgdesc='Simple SoundFont MIDI Player'
arch=('x86_64' 'aarch64')
url='https://github.com/BLumia/pineapple-midi-player/'
license=('MIT')
depends=(
    'qt5-svg'
    'portaudio'
)
makedepends=(
    'git'
    'qt5-tools'
    'cmake'
)
optdepends=(
    'soundfont-fluid: Decent SoundFont provided by FluidSynth'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/BLumia/pineapple-midi-player/archive/${pkgver}.tar.gz"
)
sha256sums=(
	'ba712f2c11b602fd425dfaa05580cd510582d62f52659434556e611e50ad9b1b'
)

build () {
    cd ${srcdir}/${pkgname}-${pkgver}
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
    cmake --build . -j`nproc`
}

package() {
    make -C ${srcdir}/${pkgname}-${pkgver} DESTDIR="$pkgdir" install
    cd ${srcdir}/${pkgname}-${pkgver}
    #make INSTALL_ROOT="$pkgdir" install
    #install -Dm755 ./ppic ${pkgdir}/usr/bin/ppic
    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
    install ./LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
