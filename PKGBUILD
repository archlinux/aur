# Maintainer: Gary Wang <wzc782970009@gmail.com>

pkgname=qmidiplayer
pkgver=0.8.8.1
pkgrel=1
pkgdesc='A cross-platform midi file player based on libfluidsynth and Qt.'
arch=('x86_64')
url='https://chrisoft.org/QMidiPlayer/'
license=('GPLv3')
depends=(
    'qt6-base'
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
    'fbe40a40814cd8414c9fe131bc350e5a3ce4e3b178aa3b80ec7e2cafcfb00750'
    'd7d9e97cc7688a7e228963f4bdb30aeb6d35100c0fc41313f0e4490c24b40f87'
)

#prepare() {
#}

build () {
	cp -r ${srcdir}/SMELT-d57232938d0c538922154e9223bf994e78c6b069/* ${srcdir}/QMidiPlayer-${pkgver}/visualization/SMELT
    cd ${srcdir}/QMidiPlayer-${pkgver}
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DUSE_QT6=ON -DCMAKE_INSTALL_LIBDIR=lib .
    make -j`nproc`
}

package() {
    make -C ${srcdir}/QMidiPlayer-${pkgver} DESTDIR="$pkgdir" install
}
