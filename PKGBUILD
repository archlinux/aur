# Packager : Louise Zanier
basename="gint"
pkgname="$basename-git"
pkgver=r55.181555a
pkgrel=1
pkgdesc="Gint and a libc for the Casio fx9860 calculators"
arch=("i686" "x86_64")
depends=("fxsdk" "sh3eb-elf-binutils" "sh3eb-elf-gcc")
options=(!strip)
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
  make folder="$pkgdir/$(fxsdk --folder)" install
}
