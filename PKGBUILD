# Maintainer: Joel Snape <aur@sna.pe>
# Maintainer: zocker_160 <zocker1600 at posteo dot net>

pkgname=rehex
pkgver=0.3.92
pkgrel=1
pkgdesc="A cross-platform (Windows, Linux, Mac) hex editor for reverse engineering, and everything else"
arch=('x86_64')
url="https://github.com/solemnwarning/rehex"
license=('GPL2')
depends=('jansson' 'capstone' 'wxgtk2' 'lua>=5.3')
#makedepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz" "rehex.patch")
sha256sums=('08dbea973754e21e580f54f51d65f74ebbd10b300cdbaf8ad19e3540a4e51596'
            '925aa979895253ba482780da91cb72fb11260dc44ce0a0f9650164f4831a5d83')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" prefix="/usr" install
  
  patch -d "$pkgdir" -p1 < "$srcdir/$pkgname.patch"
}
