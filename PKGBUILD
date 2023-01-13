# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Konstantinos Sideris <siderisk at auth dot gr>

pkgname=nheko
pkgver=0.11.0
pkgrel=1
pkgdesc="Desktop client for the Matrix protocol"
arch=('x86_64' 'i686')
url="https://github.com/Nheko-Reborn/nheko"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-svg' 'qt5-quickcontrols2' 'qt5-graphicaleffects' 'qtkeychain-qt5' 'hicolor-icon-theme' 'lmdb' 'cmark' 'mtxclient>=0.4.1' 'spdlog' 'gst-plugins-base-libs' 'gst-plugins-bad-libs')
optdepends=('qt-jdenticon: Auto-generated profile pictures (identicons)'
            'gst-plugins-good: Video calls'
            'gst-plugins-bad: Video calls'
            'gst-plugin-qmlgl: Screen sharing')
makedepends=('cmake' 'boost' 'qt5-tools' 'nlohmann-json' 'lmdbxx' 'tweeny' 'asciidoc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Nheko-Reborn/nheko/archive/v$pkgver.tar.gz")
sha512sums=('23d1c9fc1defe869e4e8b1f46f12d2ce377b3752166b94a9cecf11aad5fb9ce3db96f593f4f2ce56e6dc8bf24885fa618dbb799b86e8b5e390ba20356efa0bf3')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  # The compilation takes up a *lot* of RAM (over 10GB with 6 threads)
  # Adjust your MAKEFLAGS in /etc/makepkg.conf or add e.g. a "-j3" flag to the make command
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

