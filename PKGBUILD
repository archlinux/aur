# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='harvest'
_tag='1ef58c952d54924a8afc11afe1a2b8d126be5a62' # git rev-parse v${pkgver}
pkgver=0.8
pkgrel=1
pkgdesc='Tool to sort large collections of files according to common typologies'
arch=('x86_64')
url='https://github.com/dyne/harvest'
license=('GPL3')
makedepends=('git' 'lua-inspect' 'luajit' 'luastatic' 'pkg-config')
source=("git+https://github.com/dyne/harvest.git#tag=$_tag")
sha512sums=('SKIP')

prepare() {
  cd "$pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$pkgname"
  make PREFIX=/usr LDADD="/usr/lib/libluajit-5.1.so -lm -ldl"
}

package() {
  cd "$pkgname"
  install -Dm755 "$pkgname" "$pkgdir"/usr/bin/$pkgname
}
