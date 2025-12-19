# Maintainer: Gary Wang <git@blumia.net>

pkgname=pineapple-midi-player
pkgver=2.0.0
pkgrel=2
pkgdesc='Simple SoundFont MIDI Player'
arch=('x86_64' 'aarch64')
url='https://github.com/BLumia/pineapple-midi-player/'
license=('MIT')
depends=(
    'qt6-svg'
    'portaudio'
)
makedepends=(
    'git'
    'qt6-tools'
    'cmake'
)
optdepends=(
    'soundfont-fluid: Decent SoundFont provided by FluidSynth'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/BLumia/pineapple-midi-player/archive/${pkgver}.tar.gz"
)
sha256sums=('c006248fa913e6c1cf74c10f049816e4645a084444db161bbf2745f829abdcde')

prepare() {
    cd ${srcdir}/${pkgname}-${pkgver}
    #sed -i '/96dedbd860631f83155141030a07efc3813cfbd5/a FIND_PACKAGE_ARGS' CMakeLists.txt
}

build () {
    cd ${srcdir}/${pkgname}-${pkgver}
    cmake -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
    cmake --build . -j`nproc`
}

package() {
    make -C ${srcdir}/${pkgname}-${pkgver} DESTDIR="$pkgdir" install
    cd ${srcdir}/${pkgname}-${pkgver}
    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
    install ./LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
