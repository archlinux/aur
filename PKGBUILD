# Maintainer: zocker_160 <zocker1600 at posteo dot net>
# Contributor: Joel Snape <aur@sna.pe>

pkgname=rehex
pkgver=0.61.0
pkgrel=1
pkgdesc="A cross-platform (Windows, Linux, Mac) hex editor for reverse engineering, and everything else"
arch=('x86_64')
url="https://github.com/solemnwarning/rehex"
license=('GPL2')
depends=('jansson' 'capstone' 'wxgtk3' 'lua>=5.3' 'botan2')
makedepends=('zip' 'perl-template-toolkit' 'busted')
source=("$pkgname-$pkgver::git+https://github.com/solemnwarning/rehex.git#tag=$pkgver"
        "rehex.patch")
sha256sums=('SKIP'
            '925aa979895253ba482780da91cb72fb11260dc44ce0a0f9650164f4831a5d83')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="/usr"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" prefix="/usr" install

  patch -d "$pkgdir" -p1 < "$srcdir/$pkgname.patch"
}
