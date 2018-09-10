# Maintainer: Gimmeapill <gimmeapill at gmail dot com>

pkgname=mixxx-git
pkgver=release.2.1.3.r459.g7db928dd27
pkgrel=1
pkgdesc="Digital DJ mixing software. Development branch from git."
arch=('i686' 'x86_64')
url="http://www.mixxx.org/"
license=('GPL2')
groups=('pro-audio')
depends=('libmad' 'faad2' 'qt5-script' 'qt5-svg' 'taglib' 'libmp4v2' 'rubberband' 'portaudio' 'portmidi' 'protobuf' 'libshout' 'libid3tag' 'opusfile' 'chromaprint' 'lilv' 'upower')
makedepends=('git' 'scons' 'pkgconfig' 'glu' 'qt5-tools')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+https://github.com/mixxxdj/mixxx.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-*}"
  echo "$(git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-*}"
  export SCONSFLAGS="-j $(nproc)"
  scons qtdir=/usr/lib/qt prefix=/usr install_root="$pkgdir/usr" virtualize=0 opus=1 optimize=native build=release faad=1 modplug=1
}

package() {
  cd "$srcdir/${pkgname%-*}"
  scons qtdir=/usr/lib/qt prefix=/usr install_root="$pkgdir/usr" install
}
