# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: hybraries <macwolf@archlinux.de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Navi <navitwo.at.gmail.dot.com>
# Contributor: rabyte <rabyte.at.gmail.dot.com>
# Contributor: Johannes Krampf <wuischke.at.amule.dot.org>
# Contributor: Andrew Mcclain <tananod@mega.zik.dj>

pkgname=midori-bzr
pkgver=r6866
pkgrel=1
pkgdesc='Lightweight web browser based on WebKit and GTK3 (development version)'
arch=('x86_64' 'i686')
url='http://twotoasts.de/index.php?/pages/midori_summary.html'
license=('LGPL')
depends=('desktop-file-utils' 'gcr' 'hicolor-icon-theme' 'libnotify'
         'libunique3' 'libxss' 'libzeitgeist' 'webkitgtk')
makedepends=('bzr' 'pkg-config' 'python2' 'libxml2' 'gtk3' 'intltool'
             'python2-docutils' 'libsoup' 'vala' 'librsvg' 'cmake' 'ninja')
optdepends=('aria2: download utility'
            'steadyflow: download manager'
            'gst-plugins-base: HTML5 OGG videos support'
            'gst-plugins-good: HTML5 H264 and WebM videos support'
            'gst-libav: HTML5 H264 videos support')
provides=('midori')
replaces=('midori-git')
conflicts=('midori' 'midori-gtk2-git' 'midori-git' 'midori-gtk2-bzr')
options=('!emptydirs')
install='midori.install'
source=("midori::bzr+http://bazaar.launchpad.net/~midori/midori/trunk/")
md5sums=('SKIP')

pkgver() {
  cd midori

  printf "r%s" "$(bzr revno)"
}

build() {
  cd midori

  [[ -d build ]] && rm -rf build
  mkdir -p build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DUSE_GTK3=1 \
    -G Ninja
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C "${pkgname/-bzr}/build" install
}

# vim:set ts=2 sw=2 et:
