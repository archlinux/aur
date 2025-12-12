# Maintainer: Gary Wang <wzc782970009@gmail.com>

pkgname=qmidiplayer
pkgver=0.8.9
pkgrel=1
pkgdesc='A cross-platform midi file player based on libfluidsynth and Qt.'
arch=('x86_64')
url='https://chrisoft.org/QMidiPlayer/'
license=('GPLv3')
depends=(
    'qt6-base'
    'rtmidi' 'fluidsynth'
    'freetype2' 'zlib' 'libjpeg-turbo' 'libpng'
    'glfw' 'glew' 'openal'
)
makedepends=(
    'git'
    'cmake'
)
source=(
    "${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/chirs241097/QMidiPlayer/archive/${pkgver}.tar.gz"
    "smelt-gebe20b.zip::https://github.com/BearKidsTeam/SMELT/archive/ebe20b1fe8fe66cbb5cfa94d27ecd4111e91f680.zip"
)
sha256sums=(
    'f651ac4577442a55a7d7cb0e4fa712f940f58675fed3183431a661f50c52d1bb'
    '24b44fc3d754e2d258020d0e223c6a9e70623fcce123e32b299dd21e948b7767'
)

#prepare() {
#}

build () {
    cp -r ${srcdir}/SMELT-ebe20b1fe8fe66cbb5cfa94d27ecd4111e91f680/* ${srcdir}/QMidiPlayer-${pkgver}/visualization/SMELT
    cd ${srcdir}/QMidiPlayer-${pkgver}
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DUSE_QT6=ON -DCMAKE_INSTALL_LIBDIR=lib .
    make -j`nproc`
}

package() {
    make -C ${srcdir}/QMidiPlayer-${pkgver} DESTDIR="$pkgdir" install
}
