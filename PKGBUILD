# Maintainer: Leandro Cunha <leandrocunha016@gmail.com>

pkgname=pngphoon
pkgver=1.4
pkgrel=1
pkgdesc="Create monochromatic image displaying the current phase of the moon"
arch=('x86_64')
url="https://git.h8u.de/svolli/pngphoon"
license=('GPL-2.0-only' 'BSD-2-Clause')
depends=('glibc' 'libpng')
source=("$url/archive/release_$pkgver.tar.gz" 
        "Fix-incorrect-pointer-and-change-to-time_t.patch"
        "Fix-FTBFS-using-GCC-15.patch")
sha256sums=('dca51d3f21a2817bd24b79be652a3a4d3b7533c5dc11ffd1805787eaa789912f'
            '20d693fa2da31cc8994305693870ea4f27cb8f36800e32487619b965fb53c7d6'
            '467f3f9324fddcea8734f824d71f32df2bf2290e511790e0f46796b4df315d5a')

prepare() {
  cd "$srcdir/$pkgname"
  patch --forward --strip=1 --input="${srcdir}/Fix-incorrect-pointer-and-change-to-time_t.patch"	
  patch --forward --strip=1 --input="${srcdir}/Fix-FTBFS-using-GCC-15.patch"	
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 pngphoon "$pkgdir/usr/bin/pngphoon"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
