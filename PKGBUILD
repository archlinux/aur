# Current Maintainer: cassafrass <overload at sdf dot org>
# Former Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=saribbon
_gitname=SARibbon
pkgver=2.9.0
pkgrel=1
pkgdesc="A Ribbon control under the Qt framework, which provides an interface similar to that of Microsoft Office software."
arch=('x86_64' 'aarch64')
url="https://github.com/czyt1988/SARibbon"
license=('MIT')
depends=('qt5-base') # unsure if this is still accurate, may need qt6
makedepends=('cmake')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/czyt1988/SARibbon/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f4a0eedb498d9fda2f59e0f2c47bde9808828323ce727f271e985a1a73966b0e')

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

  # license
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}

# vim: set sw=2 ts=2 et:
