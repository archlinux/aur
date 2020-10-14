# Maintainer: Avery Murray <averylapine@gmail.com>

_pkgname=proton-call
pkgname=proton-caller
__pkgname=Proton-Caller
pkgver=1.0.0
pkgrel=6
pkgdesc="Run any Windows program through Proton"
arch=('any')
url="https://github.com/caverym/Proton-Caller/"
license=('GPL3')
depends=(
  'steam'
  'dxvk'
)
source=("https://github.com/caverym/"$__pkgname"/archive/${pkgver}.tar.gz")
sha256sums=('d3048086a536a0dbd23a5f4662947699e2e8330d0650c21bed8e812a5433d9f8')

build() {
  cd "$srcdir/$__pkgname-$pkgver"
    g++ -o "$_pkgname" main.cpp
}

package() {
  mkdir -p "$pkgdir"/usr/bin/
  mkdir -p "$pkgdir"/usr/share/licenses/"$_pkgname"/
  mkdir -p "$pkgdir"/usr/share/man/man6/
  cp -f "$srcdir/$__pkgname-$pkgver"/LICENSE "$pkgdir"/usr/share/licenses/"$_pkgname"/
  install -g 0 -o 0 -m 0644 "$srcdir/$__pkgname-$pkgver"/"$_pkgname".6 "$pkgdir"/usr/share/man/man6/
  gzip -f "$pkgdir"/usr/share/man/man6/"$_pkgname".6
  cp "$srcdir/$__pkgname-$pkgver"/"$_pkgname" "$pkgdir"/usr/bin
}
