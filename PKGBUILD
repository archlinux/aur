# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: rabyte <rabyte.at.gmail.dot.com>
# Contributor: Johannes Krampf <wuischke.at.amule.dot.org>
# Contributor: Bartłomiej Piotrowski <barthalion@gmail.com>

pkgname=midori-no-zeitgeist
pkgver=7.0
pkgrel=1
pkgdesc='Lightweight web browser (GTK3) without the zeitgeist dependency'
arch=('x86_64' 'armv7h')
url='https://midori-browser.org/'
license=('LGPL')
depends=('aria2' 'gcr' 'gobject-introspection-runtime' 'libpeas' 'libxss'
         'webkit2gtk')
makedepends=('bzr' 'cmake' 'git' 'gobject-introspection' 'intltool' 'ninja'
             'vala')
optdepends=('gst-plugins-base: HTML5 OGG videos support'
            'gst-plugins-good: HTML5 H264 and WebM videos support'
            'gst-libav: HTML5 H264 videos support')
conflicts=('midori')
provides=('midori')
options=('!emptydirs')
source=("$pkgname::git+https://github.com/midori-browser/core.git#\
tag=v${pkgver%.0}")
md5sums=('SKIP')

build() {
  mkdir -p build
  cd build
  cmake "../$pkgname" \
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

# getver: launchpad.net/midori/+download
# vim: ts=2 sw=2 et:
