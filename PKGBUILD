# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Ronan Rabouin <darkbaboon@gmail.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=plee-the-bear
pkgver=0.7.0
pkgrel=1
pkgdesc="A classic 2D platform game - rescue your kidnapped son (to slap him)."
arch=('i686' 'x86_64')
url="http://www.stuff-o-matic.com/plee-the-bear/?lang=en"
license=('GPL' 'CCPL: by-sa')
depends=('libclaw' 'sdl2_mixer' 'wxgtk2.8' 'desktop-file-utils' 'boost-libs')
makedepends=('cmake' 'boost' 'docbook-to-man')
install=$pkgname.install
source=($pkgname-$pkgver-light.tar.gz::"http://www.stuff-o-matic.com/plee-the-bear/download/file.php?platform=source")
sha256sums=('41dfe864fe2d791d6f99ba7cd330e22c94fce19d82909054eeac594aa4f2924e')

build() {
  cd $pkgname-$pkgver-light

  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=release \
    -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-2.8 \
    -DBEAR_EDITORS_ENABLED=TRUE # FALSE for no wx dependency
  make
}

package() {
  cd $pkgname-$pkgver-light

  make DESTDIR="$pkgdir/" install
}
