# Maintainer: Felix Schindler <aur at felixschindler dot net>

pkgname=cower17
_pkgname=cower
pkgver=17
pkgrel=1
pkgdesc="A simple AUR agent with a pretentious name (17x)"
arch=('i686' 'x86_64')
url="http://github.com/falconindy/cower"
license=('MIT')
depends=('curl' 'pacman' 'yajl')
makedepends=('perl')
conflicts=('cower')
provides=("cower=17")
source=("https://pkgbuild.com/~dreisner/sources/$_pkgname/$_pkgname-$pkgver.tar.gz"{,.sig})
validpgpkeys=('487EACC08557AD082088DABA1EB2638FF56C0C53')  # Dave Reisner
md5sums=('263c216e6643751b6c96eebfdd70c359'
         'SKIP')

build() {
  cd "$_pkgname-$pkgver"

  make
  sed '/^$/q' src/cower.c >LICENSE
}

package() {
  cd "$_pkgname-$pkgver"

  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ft=sh syn=sh
