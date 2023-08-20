# Maintainer: Darvin Delgado <dnmodder at gmail dot com>

pkgname=rom-properties-git
pkgver=2.2.1.r243.gd8dd8cf
pkgrel=1
pkgdesc='This shell extension adds a few nice features to file browsers for managing video game ROM and disc images.'
arch=('x86_64')
url='https://github.com/GerbilSoft/rom-properties'
license=('GPL2')
depends=('curl' 'zlib' 'libpng' 'libjpeg-turbo' 'nettle' 'tinyxml2' 'libseccomp')
optdepends=('zstd' 'lz4' 'lzo')
makedepends=('cmake' 'pkgconf' 'gettext')
replaces=('rom-properties')
conflicts=('rom-properties')
source=(
  "git+$url"
  "rom-properties-git.install"
)
sha256sums=(
  'SKIP'
  'SKIP')
install=rom-properties-git.install

pkgver() {
  cd "${pkgname%%-git}"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p build && cd build
  cmake $srcdir/${pkgname%%-git} -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBEXECDIR=lib/${pkgname%%-git} -DCMAKE_BUILD_TYPE=Release -DSPLIT_DEBUG=OFF
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install
}
# vim:set ts=2 sw=2 et:
