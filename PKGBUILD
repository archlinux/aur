# Maintainer: Darks <l.gatin@protonmail.com>
# Contributor: CoiledSpring

_basename=fxsdk
pkgname=${_basename}-git
pkgver=r35.c9dd9fa
pkgrel=1
pkgdesc="Tools to program for the Casio fx9860 calculators"
arch=("i686" "x86_64")
provides=("fxsdk" "fxconv" "fxg1a")
depends=("sh-elf-gcc-casio")
makedepends=("git")
source=("${pkgname}::git+https://gitea.planet-casio.com/Lephenixnoir/${_basename}.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname}"
  ./configure --enable-fxsdk --enable-fxconv --enable-fxg1a
  make
}

package() {
  cd "$srcdir/${pkgname}"
  
  # Dirty patch before an update from developper
  sed -i -e "s/PREFIX/DESTDIR/" Makefile

  make DESTDIR="$pkgdir/usr" install
}
