# Maintainer: Nick Gaulke <incomingstick@gmail.com>
pkgname=('openrpg-git')
pkgver=0.4.4_dev # update this when new releases happen
pkgrel=1
_orpgname=openrpg
_orpgver=v${pkgver//_/-}
pkgdesc="Open C++ library and utilities for common RPG rulesets"
arch=('x86_64')
url="https://openrpg.io"
license=('custom:OSL' 'custom:OGL')
provides=(openrpg roll name-generator character-generator)
depends=()
makedepends=('gcc>=4.7' 'cmake>=2.8.4')
changelog=
source=(git+https://github.com/incomingstick/OpenRPG#tag=${_orpgver})
noextract=()
md5sums=('SKIP')

build() {
  mkdir -p build

  cd build

  cp -v ${srcdir}/OpenRPG/LICENSE .

  cmake "${srcdir}/OpenRPG" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=RELEASE

  make && make check
}

package() {
  cd build

  make DESTDIR="${pkgdir}" install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/openrpg/LICENSE"
}
