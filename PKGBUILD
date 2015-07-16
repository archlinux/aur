# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=midori-granite-bzr
pkgver=r6997
pkgrel=1
pkgdesc='A lightweight, fast, and free web browser'
arch=('i686' 'x86_64')
url='http://midori-browser.org/'
license=('LGPL2.1')
groups=('pantheon-unstable')
depends=('gcr' 'libnotify' 'libxss' 'libzeitgeist' 'webkitgtk' 'zeitgeist'
         'libgranite.so')
makedepends=('bzr' 'cmake' 'granite-bzr' 'intltool' 'librsvg' 'ninja' 'vala')
optdepends=('gst-plugins-base: HTML5 OGG videos support'
            'gst-plugins-good: HTML5 H264 and WebM videos support'
            'gst-libav: HTML5 H264 videos support')
provides=('midori')
conflicts=('midori')
options=('!emptydirs')
install='midori.install'
source=('bzr+lp:midori')
sha256sums=('SKIP')

pkgver() {
  cd midori

  echo "r$(bzr revno)"
}

build() {
  cd midori

  [[ -d build ]] && rm -rf build
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DUSE_GRANITE='TRUE' \
    -DUSE_GTK3='TRUE' \
    -G Ninja
  ninja
}

package() {
  cd midori/build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
