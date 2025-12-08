# Maintainer: Adam Wahab <awahab@adhoc.tools>
pkgname=onelab
pkgver=r251107
pkgrel=1
pkgdesc="Open Numerical Engineering LABoratory"
arch=('x86_64')
url="https://onelab.info"
license=(GPLv2)
depends=(python)
optdepends=("gcc: c/c++ tutorials"
            "gcc-fortran: fortran tutorials"
            "julia: julia tutorials")
provides=(getdp gmsh libconveks.so)
conflicts=(getdp gmsh)
source=("$url/files/$pkgname-Linux64.zip")
sha256sums=('7d8ff7e8648e19b4b803ffb616666b7dbfaa4fc76a32483feab0f67a1fb62b76')

pkgver() {
  printf "r%s" $(awk 'match($0, /([0-9]{2})\/([0-9]{2})\/20([0-9]{2})/, arr) {print arr[3] arr[2] arr[1]}' "$srcdir/$pkgname-Linux64/README.txt")
}

package() {
  pushd "$srcdir/$pkgname-Linux64" > /dev/null
  find "./" -type f -exec install -Dm755 "{}" "$pkgdir/opt/$pkgname/{}" \;
  popd > /dev/null
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/opt/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  ln -s "/opt/$pkgname/CREDITS.txt" "$pkgdir/usr/share/licenses/$pkgname/CREDITS.txt"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  ln -s "/opt/$pkgname/README.txt" "$pkgdir/usr/share/doc/$pkgname/README.txt"
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/getdp" "$pkgdir/usr/bin/getdp"
  ln -s "/opt/$pkgname/gmsh" "$pkgdir/usr/bin/gmsh"
  install -d "$pkgdir/usr/lib"
  ln -s "/opt/$pkgname/libconveks.so" "$pkgdir/usr/lib/libconveks.so"
  desktop-file-install --dir="${pkgdir}/usr/share/applications" \
    "../onelab.desktop"
}
