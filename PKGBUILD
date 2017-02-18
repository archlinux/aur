# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=svgcleaner-git
pkgver=0.8.1.349
pkgrel=1
pkgdesc="Program for reducing size of svg images without loss"
arch=('i686' 'x86_64')
url="https://github.com/RazrFalcon/SVGCleaner"
license=('GPL2')
depends=('gcc-libs')
makedepends=('git' 'rust' 'cargo')
conflicts=('svgcleaner')
provides=('svgcleaner')
source=('git+https://github.com/RazrFalcon/SVGCleaner.git')
md5sums=('SKIP')
_gitname="SVGCleaner"

pkgver() {
  cd "$srcdir"/"$_gitname"
  printf "%s.%s" $(awk -F= '/version/ {print $2}' Cargo.toml|head -1|tr -d \") $(git rev-list --count HEAD)
}

build() {
  cd "$srcdir"/"$_gitname"
  cargo clean
  cargo build --release --verbose
}

package() {
  cd "$srcdir"/"${_gitname}"/target/release
  install -Dm755 svgcleaner "$pkgdir"/usr/bin/svgcleaner
}
