# Maintainer: muttleyxd <mateusz[ at ]szychowski.it>
pkgname=armake2-git
pkgver=85.12dd97b
pkgrel=1
pkgdesc="Rust implementation of Arma modding tools (PAA conversion, binarization/rapification, PBO packing)"
arch=('i686' 'x86_64')
url="https://github.com/KoffeinFlummi/armake2"
license=('GPL2')
depends=('openssl')
makedepends=('rust' 'git')
provides=('armake2')
conflicts=('armake2')
source=("$pkgname::git://github.com/KoffeinFlummi/armake2.git")
md5sums=('SKIP')

pkgver() 
{
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() 
{
  cd "$srcdir/$pkgname"
  cargo build --release
}

package() 
{
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/$pkgname/target/release/armake2" "$pkgdir/usr/bin/armake2"
}
