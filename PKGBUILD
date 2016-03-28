# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Sam S. <smls75@gmail.com>
# Contributor: Daniel Scharrer <daniel@constexpr.org>

pkgname=innoextract
pkgver=1.6
pkgrel=1
pkgdesc="A tool to extract installers created by Inno Setup"
url='http://constexpr.org/innoextract/'
arch=('i686' 'x86_64')
license=('ZLIB')
depends=('boost-libs' 'xz')
makedepends=('boost' 'cmake')
source=("http://constexpr.org/innoextract/files/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('66463f145fffd4d5883c6b3e2f7b2c2837d6f07095810114e514233a88c1033e'
            'SKIP')
validpgpkeys=("ADE9653703D4ADE0E997758128555A66D7E1DEC9") # Daniel Scharrer

build() {
  cd $pkgname-$pkgver
  
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" install

  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -m644 CHANGELOG "$pkgdir"/usr/share/doc/$pkgname/CHANGELOG
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
