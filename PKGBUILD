# Packager : Jules Roumieux
basename="gint"
pkgname="$basename-git"
pkgver=r32.49df2a5
pkgrel=1
pkgdesc="Gint and a libc for the Casio fx9860 calculators"
arch=("i686" "x86_64")
depends=("fxsdk")
source=("git+http://git.planet-casio.com/lephe/$basename.git")
md5sums=("SKIP")

pkgver() {
  cd "$basename"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$basename"
  ./configure
  make libc.a libgint.a
}

package() {
  cd "$basename"
  make folder="$pkgdir/usr/share" install
}
