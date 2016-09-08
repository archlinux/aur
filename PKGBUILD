# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=svgcleaner-git
pkgver=0.6.9.232
pkgrel=1
pkgdesc="Program for reducing size of svg images without loss"
arch=('i686' 'x86_64')
url="https://github.com/RazrFalcon/SVGCleaner"
license=('GPL')
depends=('gcc-libs')
makedepends=('git' 'rust' 'cargo')
source=('git+https://github.com/RazrFalcon/SVGCleaner.git')
md5sums=('SKIP')
_gitname="SVGCleaner"

pkgver() {
  cd "$srcdir"/"$_gitname"
  printf "%s.%s" $(awk -F= '/version/ {print $2}' Cargo.toml|head -1|tr -d \") $(git rev-list --count HEAD)
}
q
build() {
  cd "$srcdir"/"$_gitname"
  cargo clean
  cargo build --release
}

package() {
  cd "$srcdir"/"${_gitname}"/target/release
  install -Dm755 svgcleaner "$pkgdir"/usr/bin/svgcleaner
}
