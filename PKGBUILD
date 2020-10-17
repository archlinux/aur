# Maintainer: Avery Murray <averylapine@gmail.com>

_pkgname=proton-call
pkgname=proton-caller
__pkgname=Proton-Caller
pkgver=1.1.2
pkgrel=1
pkgdesc="Run any Windows program through Proton"
arch=('x86_64')
url="https://github.com/caverym/Proton-Caller/"
license=('GPL3')
depends=(
  'steam'
  'dxvk'
)
source=("https://github.com/caverym/"$__pkgname"/archive/${pkgver}.tar.gz")
sha256sums=('f93f888dc1d8d559e80d0e40d86098f64199d2f39fc8968f36b31cfe35827cfa')

build() {
  cd "$srcdir/$__pkgname-$pkgver"
    g++ -o "$_pkgname" main.cpp -std=c++17
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
