# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=midori-granite
pkgver=0.5.10
pkgrel=1
pkgdesc='A lightweight, fast, and free web browser'
arch=('i686' 'x86_64')
url='http://midori-browser.org/'
license=('LGPL2.1')
groups=('pantheon')
depends=('gcr' 'granite' 'libnotify' 'libxss' 'libzeitgeist' 'webkitgtk')
makedepends=('cmake' 'intltool' 'librsvg' 'ninja' 'vala')
optdepends=('aria2: Download utility'
            'gst-plugins-base: HTML5 OGG videos support'
            'gst-plugins-good: HTML5 H264 and WebM videos support'
            'gst-libav: HTML5 H264 videos support')
provides=('midori')
conflicts=('midori')
options=('!emptydirs')
install='midori.install'
source=("http://midori-browser.org/downloads/midori_${pkgver}_all_.tar.bz2")
sha256sums=('702344f68d7f034866a46398e35b3c16a5a5f3e431a5d916ea5efc3eaaa3e46f')

build() {
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
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
