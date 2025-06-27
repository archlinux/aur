# Maintainer: zaps166 <mumei6102@gmail.com>

pkgname=qmplay2
pkgver=25.06.27
pkgrel=1
pkgdesc='QMPlay2 is a video and audio player which can play most formats and codecs'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/zaps166/QMPlay2'
license=('LGPL')
depends=('qt6-base' 'qt6-svg' 'qt6-declarative' 'qt6-5compat' 'ffmpeg' 'libass' 'libgl' 'libva' 'libxv' 'alsa-lib' 'libcdio' 'taglib' 'libcddb' 'libpulse' 'libgme' 'libsidplayfp' 'pipewire' 'rubberband')
makedepends=('ninja' 'clang' 'llvm' 'lld' 'pkg-config' 'qt6-tools' 'cmake' 'fakeroot' 'patch')
options=(!lto)
source=("https://github.com/zaps166/QMPlay2/releases/download/${pkgver}/QMPlay2-src-${pkgver}.tar.xz")
sha256sums=(285bbf1ed08bc65459b2eb9fadfe03f21be696c7818d4777c43579d45834bd6e)

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
        -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
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
