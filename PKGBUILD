# Maintainer: tildearrow <acc12345acc at gmail dot com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Ali H. Caliskan <ali.h.caliskan AT gmail DOT com>
# Contributor: Ryan Coyner <rcoyner@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mixxx-qt5
pkgver=2.2.0
pkgrel=1
pkgdesc="free, open source software for digital DJ'ing, Qt5 version"
arch=('x86_64')
url='http://www.mixxx.org'
license=('GPL')
depends=('fftw' 'libid3tag' 'libmad' 'libogg' 'libshout' 'libsndfile' 'portaudio' 'portmidi'
         'taglib' 'qt5-base' 'qt5-script' 'qt5-svg' 'vamp-plugin-sdk' 'libusbx' 'protobuf'
         'faad2' 'libmp4v2' 'rubberband' 'chromaprint' 'sqlite' 'opus' 'opusfile' 'upower')
makedepends=('mesa' 'scons' 'libshout' 'glu')
provides=('mixxx')
conflicts=('mixxx')
source=("https://github.com/${pkgname%-*}dj/${pkgname%-*}/archive/release-${pkgver}.tar.gz")
md5sums=('8b6b2afd1f7bfe6ae90ad17155199925')

build() {
  cd "${srcdir}/${pkgname%-*}-release-${pkgver}"
  export SCONSFLAGS="-j $(nproc)"
  scons build=release optimize=native virtualize=0 localecompare=1 qt_sqlite_plugin=0 opus=1 \
    qt5=1 prefix=/usr faad=1
}

package() {
  cd "${srcdir}/${pkgname%-*}-release-${pkgver}"
  scons build=release optimize=native virtualize=0 localecompare=1 qt_sqlite_plugin=0 opus=1 \
    qt5=1 faad=1 prefix=/usr install_root="${pkgdir}/usr" install
}
