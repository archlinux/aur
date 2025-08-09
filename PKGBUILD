# Maintainer: Darks <darks@middleearth.com>
# Contributor: CoiledSpring

_basename=fxsdk
pkgname=${_basename}-git
pkgver=2.11.0.r0.g09e2cf5
pkgrel=1
pkgdesc='Tools to program for the Casio fx9860 calculators'
arch=('i686' 'x86_64')
provides=('fxsdk' 'fxconv' 'fxg1a')
depends=('cmake')
optdepends=(
    'gint-git: alternative library and kernel for add-in development on fx-9860G and fx-CG50'
)
makedepends=('cmake')
source=("${pkgname}::git+https://gitea.planet-casio.com/Lephenixnoir/${_basename}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname}"
  cmake -Bbuild -S. DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd "$srcdir/${pkgname}"
  DESTDIR="${pkgdir}" cmake --build build --target install
}
