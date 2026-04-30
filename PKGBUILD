# Maintainer: jojo7682345 <jojo7682345@gmail.com>
pkgname=avutils-git
pkgver=v0.1.r163.e58aa53
pkgrel=1
pkgdesc="A utilities library for C"
arch=('x86_64')
url="https://github.com/jojo7682345/avUtils.git"
license=('MIT')
makedepends=('avbuilder-git')
depends=()
provides=(avutils)
source=("git+$url")
md5sums=('SKIP') 

pkgver(){
  cd "$srcdir/avUtils"
  printf "v0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
}

build() {
  cd "$srcdir/avUtils"
  avBuilder avUtils.project
}

package() {
  cd "$srcdir/avUtils"
  install -Dm644 lib/libavUtils.a "$pkgdir/usr/lib/libavUtils.a"
  install -d "$pkgdir/usr/include/AvUtils"
  #install -Dm644 include/AvUtils/*.h "$pkgdir/usr/include/AvUtils/"
  cp -r include/AvUtils/* "$pkgdir/usr/include/AvUtils/"	
}
