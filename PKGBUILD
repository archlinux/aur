# Maintainer: Benjamin Klettbach <b dot klettbach at gmail dot com >
# Contributor: ArcticVanguard <LideEmily at gmail dot com>
# Contributor: ledti <antergist at gmail dot com>

pkgname=obs-studio-git
pkgver=0.12.4.r7.g2a99e6f
pkgrel=1
pkgdesc="Free and open source software for video recording and live streaming."
arch=('i686' 'x86_64')
url="https://github.com/jp9000/obs-studio"
license=('GPL2')
depends=('ffmpeg' 'jansson' 'libxinerama' 'libxkbcommon-x11' 'qt5-x11extras')
makedepends=('cmake' 'git' 'libfdk-aac' 'libxcomposite' 'x264')
optdepends=('libfdk-aac: FDK AAC codec support'
            'libxcomposite: XComposite capture support')
provides=('obs-studio')
conflicts=('obs-studio')
source=("obs-studio::git://github.com/jp9000/obs-studio.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "obs-studio"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "obs-studio"
  mkdir -p "build"
  cd "build"
  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DOBS_VERSION_OVERRIDE=$pkgver ..
  make
}

package() {
  cd "obs-studio/build"
  make DESTDIR="$pkgdir" install
}
