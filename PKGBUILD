# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gush-git
pkgver=0.1.0.r1.g755f5b4
pkgrel=1
epoch=1
pkgdesc="Genetic programming / stack based language on top of Guile"
arch=('any')
url="https://gitlab.com/dustyweb/gush"
license=('GPL')
depends=('guile')
makedepends=('git')
provides=('gush')
conflicts=('gush')
source=("git+https://gitlab.com/dustyweb/gush.git")
md5sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd "${pkgname%-git}"
  printf "%s" $(git describe --tags|cut -c2-|sed 's+-+.r+' | tr - .)
}

prepare() {
  cd "${pkgname%-git}"
  sed -i '71s+pre-inst-env.in+./pre-inst-env+' Makefile.am
  sed -i '72s+boot+./boot+' Makefile.am
}

build() {
  cd "${pkgname%-git}"
  autoreconf -vif
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
}
