# Maintainer: Gary Wang <wzc782970009@gmail.com>

pkgname=qmidiplayer
pkgver=0.8.8.0
pkgrel=1
pkgdesc='A cross-platform midi file player based on libfluidsynth and Qt.'
arch=('x86_64')
url='https://chrisoft.org/QMidiPlayer/'
license=('GPLv3')
depends=(
    'qt5-base' 'qt5-quickcontrols'
    'rtmidi' 'fluidsynth'
    'freetype2' 'zlib' 'libjpeg-turbo' 'libpng'
    'glfw' 'glew' 'openal' 'devil'
)
makedepends=(
    'git'
    'cmake'
)
source=(
    "${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/chirs241097/QMidiPlayer/archive/${pkgver}.tar.gz"
	"smelt-gd572329.zip::https://github.com/BearKidsTeam/SMELT/archive/d57232938d0c538922154e9223bf994e78c6b069.zip"
)
sha256sums=(
    'eb9055b7d5e386734e5896407d94483aa430059eea0938f407f23351e4f2091e'
    'd7d9e97cc7688a7e228963f4bdb30aeb6d35100c0fc41313f0e4490c24b40f87'
)

#prepare() {
#}

build () {
	cp -r ${srcdir}/SMELT-d57232938d0c538922154e9223bf994e78c6b069/* ${srcdir}/QMidiPlayer-${pkgver}/visualization/SMELT
    cd ${srcdir}/QMidiPlayer-${pkgver}
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib .
    make -j`nproc`
}

package() {
    make -C ${srcdir}/QMidiPlayer-${pkgver} DESTDIR="$pkgdir" install
}
