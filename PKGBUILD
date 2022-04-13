# Maintainer: Rhys Perry <rhysperry111@gmail.com> 

pkgname=obs-plugin-ios-camera-source-git
pkgver=v2.5.0.r133.g1e41856
pkgrel=1
pkgdesc="Use your iPhone camera as a video source in OBS Studio and stream high quality video from your iPhone's camera over USB"
arch=('x86_64')
url='https://obs.camera'
license=('GPL2')
depends=('obs-studio')
makedepends=('cmake')
source=('git+https://github.com/obsproject/obs-studio#tag=27.2.1'
        'git+https://github.com/dougg3/obs-ios-camera-source')

md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "$srcdir"/obs-ios-camera-source
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"/obs-ios-camera-source
  # Remove the build dir incase it is not being clean built
  rm -rf build
  mkdir build
  cd build
  cmake .. -DLIBOBS_INCLUDE_DIR="$srcdir"/obs-studio/cmake
  make
}

package() {
  cd "$pkgdir"
  install -Dm755 "$srcdir"/obs-ios-camera-source/build/obs-ios-camera-source.so usr/lib/obs-plugins/obs-ios-camera-source.so
  install -Dm644 "$srcdir"/obs-ios-camera-source/data/locale/en-US.ini usr/share/obs/obs-plugins/obs-ios-camera-source/en-US.ini
}
