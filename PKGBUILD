# Maintainer: zocker_160 <zocker1600 at posteo dot net>
# Contributor: Joel Snape <aur@sna.pe>

pkgname=rehex
pkgver=0.5.3
pkgrel=1
pkgdesc="A cross-platform (Windows, Linux, Mac) hex editor for reverse engineering, and everything else"
arch=('x86_64')
url="https://github.com/solemnwarning/rehex"
license=('GPL2')
depends=('jansson' 'capstone' 'wxgtk3' 'lua>=5.3')
makedepends=('zip' 'perl-template-toolkit' 'busted')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz" "rehex.patch")
sha256sums=('eabe0a4dc9341f9d0cdd6845248f818e8bc3a828476c8928fcf26828d9d67985'
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
