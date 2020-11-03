# Maintainer: Avery Murray <averylapine@gmail.com>

_pkgname=proton-call
pkgname=proton-caller
__pkgname=Proton-Caller
pkgver=1.3.0
pkgrel=3
pkgdesc="Run any Windows program through Proton"
arch=('x86_64')
url="https://github.com/caverym/Proton-Caller/"
license=('GPL3')
depends=(
  'steam'
  'dxvk'
)
conflicts=(proton-caller-git)
source=("https://github.com/caverym/"$__pkgname"/archive/${pkgver}.tar.gz")
sha256sums=('c9a4aa311c5a503dec0a6bf2f8b6ca9cb2a999d17c6087070cb940b7484e3485')

build() {
  cd "$srcdir/$__pkgname-$pkgver"
  g++ -o proton-call src/*.cpp -std=c+17
}

package() {
  mkdir -p "$pkgdir"/usr/bin/
  mkdir -p "$pkgdir"/usr/share/licenses/"$_pkgname"/
  mkdir -p "$pkgdir"/usr/share/man/man6/
  mkdir -p "$pkgdir"/usr/share/proton-caller/
  cp -f "$srcdir/$__pkgname-$pkgver"/LICENSE "$pkgdir"/usr/share/licenses/"$_pkgname"/
  install -g 0 -o 0 -m 0644 "$srcdir/$__pkgname-$pkgver"/manual/"$_pkgname".6 "$pkgdir"/usr/share/man/man6/
  gzip -f "$pkgdir"/usr/share/man/man6/"$_pkgname".6
  cp "$srcdir/$__pkgname-$pkgver"/"$_pkgname" "$pkgdir"/usr/bin
  cp "$srcdir/$__pkgname-$pkgver"/HELP "$pkgdir"/usr/share/proton-caller/
}
