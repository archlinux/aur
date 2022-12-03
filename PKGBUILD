# Maintainer: LAVALLADE Vladimir <erus.iluvatar+archlinux@gmail.com>
# Contributor: Lara Maia <lara@craft.net.br>
# Contributor: sebikul <sebikul@gmail.com>
# Contributor: Javier 'Phrodo_00' Aravena  <phrodo.00@gmail.com>

pkgname=ascii-invaders
pkgver=1.0.1
pkgrel=1
pkgdesc="Clone of Space Invaders for text-terminals using the ncurses library"
arch=("i686" "x86_64")
url="https://github.com/macdice/ascii-invaders"
license=('GPL2')
depends=('ncurses')
source=(https://github.com/macdice/"$pkgname"/archive/refs/tags/v"$pkgver".tar.gz
	format-security.patch)
sha256sums=('6d54de95370817f520a1e5cb0cdf884c0417415bfb15e679d5b39998991723cd'
            'ae85a81e2df79533372ba9a391ac3247ac62ad6a929467671db36b22d08e1c4a')

prepare() {
  patch -p1 -i ./format-security.patch
}

build() {
  cd "$srcdir"/"$pkgname"-"$pkgver"
  make
}

package(){
  cd "$srcdir"/"$pkgname"-"$pkgver"
  install -Dm755 ascii_invaders "$pkgdir"/usr/bin/ascii_invaders
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
