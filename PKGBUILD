# Maintainer: Gimmeapill <gimmeapill at gmail dot com>

pkgname=mixxx-git
pkgver=release.2.0.0.r2462.g2d4f67e
pkgrel=1
pkgdesc="Digital DJ mixing software. Development branch from git."
arch=('i686' 'x86_64')
url="http://www.mixxx.org/"
license=('GPL2')
#depends=('libid3tag' 'libmad' 'portaudio' 'qt4' 'libshout' 'taglib' 'portmidi' 'protobuf' 'libusbx' 'chromaprint' 'rubberband' 'vamp-plugin-sdk' 'sqlite' 'opus' 'opusfile' 'hidapi')
depends=('libid3tag' 'libmad' 'portaudio' 'qt4' 'libshout' 'taglib' 'portmidi' 'protobuf' 'chromaprint' 'rubberband' 'opusfile' 'hidapi' 'faad2' 'libmp4v2')
makedepends=('git' 'scons' 'pkgconfig' 'glu')
provides=(mixxx)
conflicts=(mixxx mixxx1.11-git mixxx1.12-git mixxx_stable-git)
source=('mixxx::git+https://github.com/mixxxdj/mixxx.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/mixxx"
  echo "$(git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/mixxx"
  scons qtdir=/usr/lib/qt4 prefix=/usr install_root="$pkgdir/usr" -j2 virtualize=0 localecompare=1 qt_sqlite_plugin=0 opus=1 optimize=native build=release battery=0 faad=1
}

package() {
  cd "$srcdir/mixxx"
  scons qtdir=/usr/lib/qt4 prefix=/usr install_root="$pkgdir/usr" install
}
