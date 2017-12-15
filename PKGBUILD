# Maintainer: Gimmeapill <gimmeapill at gmail dot com>

pkgname=mixxx-git
pkgver=release.2.0.0.r6032.g24028f2e8
pkgrel=1
pkgdesc="Digital DJ mixing software. Development branch from git."
arch=('i686' 'x86_64')
url="http://www.mixxx.org/"
license=('GPL2')
depends=(libmad libusb faad2 qt4 taglib libmp4v2 rubberband portaudio portmidi protobuf libshout libid3tag opusfile chromaprint)
makedepends=('git' 'scons' 'pkgconfig' 'glu')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}" mixxx1.11-git mixxx1.12-git mixxx_stable-git)
source=("${pkgname%-*}::git+https://github.com/mixxxdj/mixxx.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-*}"
  echo "$(git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-*}"
  scons qtdir=/usr/lib/qt4 prefix=/usr install_root="$pkgdir/usr" -j2 virtualize=0 localecompare=1 qt_sqlite_plugin=0 opus=1 optimize=native build=release battery=0 faad=1
}

package() {
  cd "$srcdir/${pkgname%-*}"
  scons qtdir=/usr/lib/qt4 prefix=/usr install_root="$pkgdir/usr" install
}
