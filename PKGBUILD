# Maintainer: Allen Wild <allenwild93@gmail.com>

pkgname=ts-analyzer-git
pkgver=0.1.r12.g5d7f034
pkgrel=1
pkgdesc='MPEG TS Stream analyzer, based on Qt5 and FFmpeg'
arch=('x86_64')
url='https://github.com/xuguangxiao/ts_analyzer'
license=('LGPL3')
depends=('qt5-base' 'qtav' 'ffmpeg')
makedepends=('cmake' 'git')
# note: use packager fork with build patches
source=("git+https://github.com/aswild/ts_analyzer")
sha256sums=('SKIP')

pkgver() {
  # no git tags, just use revision count
  cd "$srcdir/ts_analyzer"
  echo "0.1.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p build
  cmake -S "$srcdir/ts_analyzer" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  cmake --build build -- install DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et:
