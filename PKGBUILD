# Maintainer: Joel Snape <aur@sna.pe>
# Maintainer: zocker_160 <zocker1600 at posteo dot net>

pkgname=rehex
pkgver=0.5.0
pkgrel=2
pkgdesc="A cross-platform (Windows, Linux, Mac) hex editor for reverse engineering, and everything else"
arch=('x86_64')
url="https://github.com/solemnwarning/rehex"
license=('GPL2')
depends=('jansson' 'capstone' 'wxgtk3' 'lua>=5.3')
makedepends=('zip' 'perl-template-toolkit' 'busted')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz" "rehex.patch")
sha256sums=('f6737e44d98da9a81ba0217da56fc0b4d36338204ab5f076b77af536a4b35981'
            '925aa979895253ba482780da91cb72fb11260dc44ce0a0f9650164f4831a5d83')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  # gtk3 patch
  sed -i -e 's/wx-config/wx-config-gtk3/g' Makefile
  
  make prefix="/usr"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" prefix="/usr" install
  
  patch -d "$pkgdir" -p1 < "$srcdir/$pkgname.patch"
}
