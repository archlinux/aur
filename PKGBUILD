# Maintainer: Scott Alfter <scott@alfter.us>
# Contributor: Anders Thomsen <thomsen dot anders at gmail dot com>

pkgname=openkj
pkgver=2.0.8
pkgrel=1
pkgdesc="Open KJ - Cross-platform open source karaoke hosting software"
arch=('i686' 'x86_64')
url="https://openkj.org/"
license=('GPL3')
depends=('qt5-multimedia' 'gst-plugins-good' 'taglib1')
makedepends=('qt5-tools' 'git' 'cmake')
provides=("$pkgname=$pkgver")
conflicts=('openkj-git')
install=$pkgname.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/OpenKJ/OpenKJ/archive/refs/tags/v${pkgver}-release.tar.gz")
sha256sums=('8a24f58e31f4a0abd5e4d0d6703940e96d00305baa57c24aa6ca727bcf6d1fd5')

build() {
  cd "${srcdir}/OpenKJ-${pkgver}-release/"
  export PKG_CONFIG_PATH=/usr/lib/taglib1/pkgconfig
  cmake -DCMAKE_INSTALL_PREFIX='/usr' CMakeLists.txt
  make
}

package() {
  cd "${srcdir}/OpenKJ-${pkgver}-release/"
  make DESTDIR="$pkgdir" install
}
