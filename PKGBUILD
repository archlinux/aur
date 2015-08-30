# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=midori-granite
pkgver=0.5.11
pkgrel=1
pkgdesc='A lightweight, fast, and free web browser'
arch=('i686' 'x86_64')
url='http://midori-browser.org/'
license=('LGPL2.1')
groups=('pantheon')
depends=('cairo' 'desktop-file-utils' 'gcr' 'gdk-pixbuf2' 'glib2' 'glibc'
         'gtk3' 'hicolor-icon-theme' 'libsoup' 'libx11' 'libxml2' 'libxss'
         'pango' 'sqlite' 'webkitgtk' 'zeitgeist'
         'libgranite.so')
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
sha256sums=('96191a96be71144ae848a409fae5a1d6d52a00e583f33122081f47ead9c49c3d')

prepare() {
  cd midori-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd midori-${pkgver}/build

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
  cd midori-${pkgver}/build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
