# Maintainer: zaps166 <spaz16@wp.pl>

pkgname=qmplay2
pkgver=24.03.16
pkgrel=1
pkgdesc='QMPlay2 is a video and audio player which can play most formats and codecs'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/zaps166/QMPlay2'
license=('LGPL')
depends=('qt6-base' 'qt6-svg' 'qt6-declarative' 'ffmpeg' 'libass' 'libgl' 'libva' 'libxv' 'alsa-lib' 'libcdio' 'taglib' 'libcddb' 'libpulse' 'libgme' 'libsidplayfp' 'pipewire' 'rubberband')
optdepends=('pulseaudio: PulseAudio support'
            'game_music_emu-kode54-git: Better chiptune support (less bugs in sound, AUR package)')
makedepends=('ninja' 'clang' 'pkg-config' 'qt6-tools' 'cmake' 'fakeroot' 'patch')
source=("https://github.com/zaps166/QMPlay2/releases/download/${pkgver}/QMPlay2-src-${pkgver}.tar.xz")
sha256sums=(88eea02d72df6af60e45cb2d3e4b0ade717b8cca2cf2999868c482a89c856e3c)

prepare()
{
    mkdir -p $srcdir/QMPlay2-build
}

build()
{
    cd $srcdir/QMPlay2-build
    cmake \
        -G Ninja \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        ../QMPlay2-src-${pkgver} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DUSE_CHIPTUNE_SID=ON \
        -DUSE_LINK_TIME_OPTIMIZATION=OFF \
        -DUSE_PCH=ON \
        -DUSE_GLSLC=OFF \
        -DUSE_GIT_VERSION=OFF
    time ninja
}

package()
{
    cd $srcdir/QMPlay2-build
    DESTDIR=$pkgdir ninja install
}
