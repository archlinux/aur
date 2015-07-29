# Maintainer: Benjamin Klettbach <b.klettbach@gmail.com>

pkgname=obs-studio
pkgver=0.11.2
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
sha256sums=('cc1b1172506aa535b0d22802d2669b325f6ddda92eb257122440cccd50f1a664')

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

