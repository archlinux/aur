# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gush-git
pkgver=0.1.0.1.g755f5b4
pkgrel=1
pkgdesc="Genetic programming / stack based language on top of Guile"
arch=('any')
url="https://gitlab.com/dustyweb/gush"
license=('GPL')
depends=('guile-git')
makedepends=('git')
provides=('gush')
conflicts=('gush')
source=("git+https://gitlab.com/dustyweb/gush.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "%s" $(git describe --tags|cut -c2-|tr - .)
}

build() {
  cd "${pkgname%-git}"
  ./bootstrap.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
}
