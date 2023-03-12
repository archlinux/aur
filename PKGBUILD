# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: rabyte <rabyte@gmail.com>
# Contributor: Johannes Krampf <wuischke@amule.org>
# Contributor: Bartłomiej Piotrowski <barthalion@gmail.com>

pkgname=midori
pkgver=9.0
pkgrel=5
pkgdesc='Lightweight web browser'
arch=(x86_64)
url='https://github.com/midori-browser/core'
license=(LGPL)
depends=(aria2 gcr libarchive libpeas libxss webkit2gtk zeitgeist)
makedepends=(bzr cmake git gobject-introspection intltool ninja vala)
optdepends=('gst-plugins-base: HTML5 OGG videos support'
            'gst-plugins-good: HTML5 H264 and WebM videos support'
            'gst-libav: HTML5 H264 videos support')
options=(!emptydirs)
source=("$pkgname::git+https://github.com/midori-browser/core.git#commit=f6b3b1e030db7eb2de7faf73ec4ccc18949b668d") # tag: v9.0
md5sums=('SKIP')

build() {
  mkdir -p build
  cd build
  cmake ../$pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_C_FLAGS="$CFLAGS -fPIC -w" \
    -DVALA_CFLAGS="$CFLAGS -fPIC -w" \
    -G Ninja
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# getver: -u 8 raw.githubusercontent.com/midori-browser/core/master/CMakeLists.txt
