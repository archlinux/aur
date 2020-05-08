# Maintainer: Darks <l.gatin@protonmail.com>
# Contributor: CoiledSpring

_basename=fxsdk
pkgname=${_basename}-git
pkgver=r35.c9dd9fa
pkgrel=3
pkgdesc="Tools to program for the Casio fx9860 calculators"
arch=("i686" "x86_64")
provides=("fxsdk" "fxconv" "fxg1a")
depends=()
makedepends=("git")
source=("${pkgname}::git+https://gitea.planet-casio.com/Lephenixnoir/${_basename}.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname}"
  ./configure --enable-fxsdk --enable-fxconv --enable-fxg1a --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname}"
  
  make PREFIX="$pkgdir/usr" install
}
