# Contributor: Collin 'Fwirt' Skiles <sploopby at gmail dot com>
# Contributor: Brian "saikobee" Mock <mock.brian at gmail dot com>
# Maintainer: Carlos Solis <csolisr at gmail dot com>
pkgname=sfxr
pkgver=1.2.1
pkgrel=6
pkgdesc="Random sound effect generator for games, etc."
arch=('i686' 'x86_64')
url="http://www.drpetter.se/project_sfxr.html"
license=('MIT')
depends=('gtk3' 'sdl')
source=("http://www.drpetter.se/files/$pkgname-sdl-$pkgver.tar.gz")
md5sums=('794f18f5c527a344c7366687aa634d71')

build() {
  cd "$srcdir/$pkgname-sdl-$pkgver"

  # Uncomment below and change the dependences
  # if you plan to use GTK2 instead of GTK3
  # sed -i 's|GTK=3.0|GTK=2.0|' Makefile

  make DESTDIR="$pkgdir"
}

package() {
  cd "$srcdir/$pkgname-sdl-$pkgver"

  make DESTDIR="$pkgdir" install

  grep -A 21 "Copyright" readme.txt > LICENSE
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
