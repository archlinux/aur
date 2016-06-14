# Maintainer:         Alexander Blinne "Sunday" <alexander at blinne dot net>

_pkgname=sview
pkgname=$_pkgname-git
pkgver=15.11.r160.gc5122f2
pkgrel=1
pkgdesc="Stereoscopic 3D video player with OpenGL UI"
arch=('i686' 'x86_64')
url="http://www.sview.ru/en"
license=('custom')
depends=('libconfig' 'ffmpeg' 'freetype2' 'gtk2' 'libgl' 'libx11' 'libxext' 'libxpm' 'openal')
optdepends=('ttf-droid' 'ttf-nanum')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://github.com/gkv311/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g'
}

prepare() {
    sed -i.bak 's/PixelFormat/AVPixelFormat/g;s/AVAVPixelFormat/AVPixelFormat/g' $srcdir/sview/include/StAV/stAV.h
    sed -i.bak 's/PixelFormat/AVPixelFormat/g;s/AVAVPixelFormat/AVPixelFormat/g' $srcdir/sview/include/StAV/StAVFrame.h 
    sed -i.bak 's/PixelFormat/AVPixelFormat/g;s/AVAVPixelFormat/AVPixelFormat/g' $srcdir/sview/StShared/StAVFrame.cpp 
    sed -i.bak 's/PixelFormat/AVPixelFormat/g;s/AVAVPixelFormat/AVPixelFormat/g' $srcdir/sview/StShared/StAVImage.cpp
    sed -i.bak 's/PixelFormat/AVPixelFormat/g;s/AVAVPixelFormat/AVPixelFormat/g' $srcdir/sview/StShared/stAV.cpp
    sed -i.bak 's/PixelFormat/AVPixelFormat/g;s/AVAVPixelFormat/AVPixelFormat/g' $srcdir/sview/StMoviePlayer/StVideo/StAVPacketQueue.h
    sed -i.bak 's/PixelFormat/AVPixelFormat/g;s/AVAVPixelFormat/AVPixelFormat/g' $srcdir/sview/StMoviePlayer/StVideo/StAVPacketQueue.cpp
    sed -i.bak 's/PixelFormat/AVPixelFormat/g;s/AVAVPixelFormat/AVPixelFormat/g' $srcdir/sview/StMoviePlayer/StVideo/StVideoQueue.h
    sed -i.bak 's/PixelFormat/AVPixelFormat/g;s/AVAVPixelFormat/AVPixelFormat/g' $srcdir/sview/StMoviePlayer/StVideo/StVideoQueue.cpp
    sed -i.bak 's/PixelFormat/AVPixelFormat/g;s/AVAVPixelFormat/AVPixelFormat/g' $srcdir/sview/StMoviePlayer/StVideo/StVideo.cpp
}

build() {
  cd $_pkgname
  unset ANDROID_NDK
  msg2 "Starting make..."
  make -j1 all
}

package() {
  cd $_pkgname
  msg2 "Starting make install..."
  make DESTDIR="$pkgdir" install
  mkdir -p $pkgdir/usr/share/licenses/$_pkgname/
  cp LICENSE.md $pkgdir/usr/share/licenses/$_pkgname/
}
