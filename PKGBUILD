# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: hybraries <macwolf@archlinux.de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Navi <navitwo.at.gmail.dot.com>
# Contributor: rabyte <rabyte.at.gmail.dot.com>
# Contributor: Johannes Krampf <wuischke.at.amule.dot.org>

pkgname=midori-git
pkgver=0.6.0.r8628.7b765721
_pkgver=0.6.0
pkgrel=1
pkgdesc='Lightweight web browser based on WebKit and GTK3. Git development version.'
arch=('x86_64' 'i686')
url='https://midori-browser.org/'
license=('LGPL')
depends=('aria2' 'gcr' 'gobject-introspection-runtime' 'libpeas' 'libxss' 'webkit2gtk' 'zeitgeist')
makedepends=('bzr' 'cmake' 'git' 'gobject-introspection' 'intltool' 'ninja' 'vala')
optdepends=('gst-plugins-base: HTML5 OGG videos support'
            'gst-plugins-good: HTML5 H264 and WebM videos support'
            'gst-libav: HTML5 H264 videos support')
provides=('midori')
conflicts=('midori' 'midori-gtk2-git')
options=('!emptydirs')
source=("git+https://github.com/midori-browser/core")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/core"
  printf "$_pkgver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
  cd "$srcdir/core"
  mkdir -p build
  cd build
  cmake "../" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DHALF_BRO_INCOM_WEBKIT2=ON \
    -DCMAKE_C_FLAGS="$CFLAGS -fPIC -w" \
    -DVALA_CFLAGS="$CFLAGS -fPIC -w" \
    -G Ninja
  ninja

}

package() {
  cd "$srcdir/core"

  DESTDIR="$pkgdir" ninja -C build  install
}

# vim:set ts=2 sw=2 et:
