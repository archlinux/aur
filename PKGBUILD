# Maintainer: Benjamin Klettbach <b.klettbach@gmail.com>

pkgname=obs-studio
pkgver=0.12.4
pkgrel=1
pkgdesc="Free and open source software for video recording and live streaming."
arch=('i686' 'x86_64')
url="https://github.com/jp9000/obs-studio"
license=('GPL2')
depends=('ffmpeg' 'jansson' 'libxinerama' 'libxkbcommon-x11' 'qt5-x11extras' 'curl')
makedepends=('cmake' 'libfdk-aac' 'libxcomposite' 'x264')
optdepends=('libfdk-aac: FDK AAC codec support'
            'libxcomposite: XComposite capture support')
provides=('obs-studio')
conflicts=('obs-studio-git')
source=("https://github.com/jp9000/obs-studio/archive/$pkgver.tar.gz")
sha256sums=('61ca7c1078e278ef498f06d75b8d150bdbb5d6c0fa4b0d433d90bcd176593d2c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "build"
  cd "build"
  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DOBS_VERSION_OVERRIDE=$pkgver ..
  make -j`nproc`
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make install DESTDIR="$pkgdir"
}

