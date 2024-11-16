# Maintainer: A Farzat <a@farzat.xyz>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: crab <crabtw@gmail.com>

pkgname=gem2arch
pkgver=0.11
pkgrel=3
pkgdesc='Create PKGBUILD from Ruby Gem Package'
arch=(any)
license=(GPL3)
url='https://github.com/anatol/gem2arch'
depends=(ruby ruby-erubis)
optdepends=(
  'git: for --git support'
)
makedepends=(patch)
source=(gem2arch-$pkgver.zip::https://github.com/anatol/gem2arch/archive/$pkgver.zip
0001-Fix-8-remove-mkaurball.diff
0002-Add-missing-library.diff)
sha1sums=('9fe76219255f251f85df7080ceece0dfe766b885'
'482ed5bcd7211f6c0dfb80c5fbc119045489c15e'
'c06c576debb3c5159e00d66cc76b0cb279904a75')

# Temporary fixes
prepare() {
  cd $pkgname-$pkgver
  patch -p1 -s -i ../0001-Fix-8-remove-mkaurball.diff
  patch -p1 -s -i ../0002-Add-missing-library.diff
}

package() {
  cd $pkgname-$pkgver
  install -D -m755 gem2arch.rb "$pkgdir/usr/bin/gem2arch"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
