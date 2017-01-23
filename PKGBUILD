# Packager : Jules Roumieux
basename="fxsdk"
pkgname="$basename-git"
pkgver=r9.e4bde46
pkgrel=1
pkgdesc="Tools to program for the Casio fx9860 calculators"
arch=("i686" "x86_64")
source=("git+http://git.planet-casio.com/lephe/$basename.git")
md5sums=("SKIP")

pkgver() {
  cd "$basename"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$basename"
  make
}

package() {
  cd "$basename"
  mkdir -p "$pkgdir/usr/bin/"
  install -m 755 bin/* "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/fxsdk"
  install -m 644 runtime/* "$pkgdir/usr/share/fxsdk"
}
