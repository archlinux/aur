# Maintainer: Phil Hoffmann <phil dot hoffmann at zoho dot eu>

pkgname=gm-companion
pkgver=1.2.1
pkgrel=1
pkgdesc="A tool for rpg gamemasters."
url="https://gm-companion.github.io/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('qt6-base>=6.5.0' 'qt6-5compat>=6.5.0' 'qt6-declarative>=6.5.0' 'qt6-multimedia>=6.5.0' 'qt6-tools>=6.5.0' 'poppler-qt6' 'qtkeychain-qt6' 'quazip-qt6' 'discount' 'taglib')
optdepends=('librespot: Spotify support')
makedepends=('cmake')
conflicts=('gm-companion-git')
source=("https://github.com/PhilInTheGaps/GM-Companion/releases/download/${pkgver}/gm-companion_${pkgver}.tar.gz")
sha512sums=('65cd814b3b5dcaa77e2c09e84dab2397be50264f4580b42cded33b69c59138c5cd0a692f312f15af8d201074e5c487133746643b1d13cb725f04dc61754b9a29')

build() {
  cd "${srcdir}/gm-companion_${pkgver}"
  mkdir build
  cd build
  cmake .. -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX="${pkgdir}/usr" -DCMAKE_UNITY_BUILD=ON
  cmake --build . --parallel
}

package() {
  cd "${srcdir}/gm-companion_${pkgver}/build"
  cmake --install .

  rm -rf "${pkgdir}/usr/include"
  rm -rf "${pkgdir}/usr/lib"
}

