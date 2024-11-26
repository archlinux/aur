# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=saribbon
_gitname=SARibbon
pkgver=2.1.0
pkgrel=1
pkgdesc="A Ribbon control under the Qt framework, which provides an interface similar to that of Microsoft Office software."
arch=('x86_64' 'aarch64')
url="https://github.com/czyt1988/SARibbon"
license=('MIT')
depends=('qt5-base')
makedepends=('cmake')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/czyt1988/SARibbon/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9c224035f0693794958ffbbe36d583d6f783719ac92a8299b638d2a8a97513ed')

build() {
  cd ${_gitname}-${pkgver}

  cmake -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSARIBBON_BUILD_EXAMPLES=OFF \
        -Wno-dev \
        -B build
  cmake --build build
}

check() {
  cd ${_gitname}-${pkgver}

  ctest --test-dir build --output-on-failure
}

package() {
  cd ${_gitname}-${pkgver}

  DESTDIR="$pkgdir" cmake --install build
  
  #fix path
  install -dm755 ${pkgdir}/usr/share/${pkgname}
  mv ${pkgdir}/usr/SARibbonBar_amalgamate/ ${pkgdir}/usr/share/${pkgname}

  # license
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}

# vim: set sw=2 ts=2 et:
