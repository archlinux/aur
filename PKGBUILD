# Maintainer: Gimmeapill <gimmeapill at gmail dot com>

pkgname=mixxx-git
pkgver=release.2.0.0.r1331.g0bb5703
pkgrel=1
pkgdesc="Digital DJ mixing software. Development branch from git with cpu optimization enabled. Note: git branch for 2.0 is still called 1.12"
arch=('i686' 'x86_64')
url="http://www.mixxx.org/"
license=('GPL2')
depends=('libid3tag' 'libmad' 'portaudio' 'qt4' 'libshout' 'taglib' 'portmidi' 'protobuf' 'libusbx' 'chromaprint' 'rubberband' 'vamp-plugin-sdk' 'sqlite' 'opus' 'opusfile')
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
  scons qtdir=/usr/lib/qt4 prefix=/usr install_root="$pkgdir/usr" -j2 virtualize=0 localecompare=1 qt_sqlite_plugin=0 opus=1 optimize=native build=release
}

package() {
  cd "$srcdir/mixxx"
  scons qtdir=/usr/lib/qt4 prefix=/usr install_root="$pkgdir/usr" install
}
