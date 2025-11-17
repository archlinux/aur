# Maintainer: Gary Wang <git@blumia.net>

pkgname=pineapple-midi-player
pkgver=2.0.0beta
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
    #"${pkgname}-${pkgver}.tar.gz::https://github.com/BLumia/pineapple-midi-player/archive/${pkgver}.tar.gz"
    "${pkgname}-${pkgver}.tar.gz::https://github.com/BLumia/pineapple-midi-player/archive/2.0.0-beta.tar.gz"
)
sha256sums=(
    "24db686c9b11df1c3aecd84606327e7516878f7dc1b68ebc928cf729c237d3b8"
)

prepare() {
    #cd ${srcdir}/${pkgname}-${pkgver}
    cd ${srcdir}/${pkgname}-2.0.0-beta
    #sed -i '/96dedbd860631f83155141030a07efc3813cfbd5/a FIND_PACKAGE_ARGS' CMakeLists.txt
}

build () {
    #cd ${srcdir}/${pkgname}-${pkgver}
    cd ${srcdir}/${pkgname}-2.0.0-beta
    cmake -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
    cmake --build . -j`nproc`
}

package() {
    #make -C ${srcdir}/${pkgname}-${pkgver} DESTDIR="$pkgdir" install
    make -C ${srcdir}/${pkgname}-2.0.0-beta DESTDIR="$pkgdir" install
    #cd ${srcdir}/${pkgname}-${pkgver}
    cd ${srcdir}/${pkgname}-2.0.0-beta
    #make INSTALL_ROOT="$pkgdir" install
    #install -Dm755 ./ppic ${pkgdir}/usr/bin/ppic
    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
    install ./LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
