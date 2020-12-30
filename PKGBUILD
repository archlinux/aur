# Maintainer:  Tássio Virgínio <tassiovirginio at gmail.com>

pkgname=obs-studio-stable
pkgver=26.1.0
appname=obs-studio
pkgrel=3
pkgdesc="Free, open source software for live streaming and recording"
arch=('x86_64')
url="https://obsproject.com"
license=('GPL2')
depends=('ffmpeg' 'jansson' 'libxinerama' 'libxkbcommon-x11' 'mbedtls'
         'qt5-svg' 'qt5-x11extras' 'curl' 'jack' 'gtk-update-icon-cache')
makedepends=('cmake' 'libfdk-aac' 'libxcomposite' 'x264' 'vlc' 'swig' 'python' 'luajit')
optdepends=('libfdk-aac: FDK AAC codec support'
            'libxcomposite: XComposite capture support'
            'libva-intel-driver: hardware encoding'
            'libva-mesa-driver: hardware encoding'
            'luajit: scripting support'
            'python: scripting support'
            'vlc: VLC Media Source support')
source=($appname-$pkgver.tar.gz::https://github.com/jp9000/obs-studio/archive/$pkgver.tar.gz)
md5sums=('f8bb9216ece8587f2067ead1ef12a7c9')

prepare() {
  cd $appname-$pkgver
}

build() {
  cd $appname-$pkgver

  mkdir -p build; cd build

  cmake -DCMAKE_INSTALL_PREFIX="/usr" \
    -DBUILD_CAPTIONS=ON \
    -DOBS_VERSION_OVERRIDE="$pkgver-$pkgrel" ..

  make
}

package() {
  cd $appname-$pkgver/build

  make install DESTDIR="$pkgdir"
}
