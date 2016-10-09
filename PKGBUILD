# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Josef Hopfgartner <josef@netzagentur.at>
pkgname=composer-git
pkgver=2.0rc1.16.gf2dd64e
epoch=1
pkgrel=1
pkgdesc="Song editor for karaoke games"
arch=(i686 x86_64)
url="http://performous.org/composer"
license=(GPL)
depends=(qt5-multimedia ffmpeg)
makedepends=(git cmake)
provides=(composer)
conflicts=(composer)
source=(git+https://github.com/performous/composer.git)
sha512sums=('SKIP')

pkgver() {
  cd composer
  git describe --tags | tr - .
}

build() {
  cd "${srcdir}/composer"
  mkdir build -p
  cd build

  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..
  make
}

package() {
  cd composer/build
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
