# Maintainer:         Alexander Blinne "Sunday" <alexander at blinne dot net>

pkgname=sview
_pkgver=15.11-1
pkgver=15.11.1
pkgrel=1
pkgdesc="Stereoscopic 3D video player with OpenGL UI"
arch=('i686' 'x86_64')
url="http://www.sview.ru/en"
license=('custom')
depends=('libconfig' 'ffmpeg' 'freetype2' 'gtk2' 'libgl' 'libx11' 'libxext' 'libxpm' 'openal')
optdepends=('ttf-droid' 'ttf-nanum')
source=("http://download.sview.ru/src/sview-$_pkgver.tar.gz")
sha256sums=('24943edf89dde7c3ca761ffeef6bd19272b64efe25e4347c3186628d173b9d25')

prepare() {
    sed -i.bak 's/PixelFormat/AVPixelFormat/g;s/AVAVPixelFormat/AVPixelFormat/g' $srcdir/sview-$_pkgver/include/StAV/stAV.h
    sed -i.bak 's/PixelFormat/AVPixelFormat/g;s/AVAVPixelFormat/AVPixelFormat/g' $srcdir/sview-$_pkgver/include/StAV/StAVFrame.h 
    sed -i.bak 's/PixelFormat/AVPixelFormat/g;s/AVAVPixelFormat/AVPixelFormat/g' $srcdir/sview-$_pkgver/StShared/StAVFrame.cpp 
    sed -i.bak 's/PixelFormat/AVPixelFormat/g;s/AVAVPixelFormat/AVPixelFormat/g' $srcdir/sview-$_pkgver/StShared/StAVImage.cpp
    sed -i.bak 's/PixelFormat/AVPixelFormat/g;s/AVAVPixelFormat/AVPixelFormat/g' $srcdir/sview-$_pkgver/StShared/stAV.cpp
    sed -i.bak 's/PixelFormat/AVPixelFormat/g;s/AVAVPixelFormat/AVPixelFormat/g' $srcdir/sview-$_pkgver/StMoviePlayer/StVideo/StAVPacketQueue.h
    sed -i.bak 's/PixelFormat/AVPixelFormat/g;s/AVAVPixelFormat/AVPixelFormat/g' $srcdir/sview-$_pkgver/StMoviePlayer/StVideo/StAVPacketQueue.cpp
    sed -i.bak 's/PixelFormat/AVPixelFormat/g;s/AVAVPixelFormat/AVPixelFormat/g' $srcdir/sview-$_pkgver/StMoviePlayer/StVideo/StVideoQueue.h
    sed -i.bak 's/PixelFormat/AVPixelFormat/g;s/AVAVPixelFormat/AVPixelFormat/g' $srcdir/sview-$_pkgver/StMoviePlayer/StVideo/StVideoQueue.cpp
    sed -i.bak 's/PixelFormat/AVPixelFormat/g;s/AVAVPixelFormat/AVPixelFormat/g' $srcdir/sview-$_pkgver/StMoviePlayer/StVideo/StVideo.cpp
}

build() {
  cd $pkgname-$_pkgver
  unset ANDROID_NDK
  msg2 "Starting make..."
  make -j1 all
}

package() {
  cd $pkgname-$_pkgver
  msg2 "Starting make install..."
  make DESTDIR="$pkgdir" install
  mkdir -p $pkgdir/usr/share/licenses/$_pkgname/
  cp LICENSE license* $pkgdir/usr/share/licenses/$_pkgname/
}
