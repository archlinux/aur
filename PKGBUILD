# Maintainer: Darks <darks@middleearth.com>
# Contributor: CoiledSpring

_basename=fxsdk
pkgname=${_basename}-git
pkgver=2.3.1.r0.g0db7ae9
pkgrel=1
pkgdesc='Tools to program for the Casio fx9860 calculators'
arch=('i686' 'x86_64')
provides=('fxsdk' 'fxconv' 'fxg1a')
depends=('cmake')
optdepends=(
  'gint-git: alternative library and kernel for add-in development on fx-9860G and fx-CG50'
  'mkg3a: a tool to create Casio FX-CG addon files.')
makedepends=('git' 'gcc')
source=("${pkgname}::git+https://gitea.planet-casio.com/Lephenixnoir/${_basename}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname}"
  ./configure --enable-fxsdk --enable-fxconv --enable-fxg1a --prefix="/usr"
  make all
}

package() {
  cd "$srcdir/${pkgname}"
  make PREFIX="${pkgdir}/usr" install
}
