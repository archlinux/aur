# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=femtolisp-git
pkgver=r273.4087d6a
pkgrel=1
pkgdesc="lightweight, robust, scheme-like lisp implementation"
arch=('i686' 'x86_64')
url="https://github.com/JeffBezanson/femtolisp"
depends=('glibc')
license=('custom:BSD')
provides=('femtolisp')
conflicts=('femtolisp')
makedepends=('git')
source=("git+https://github.com/JeffBezanson/femtolisp")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "${pkgname%-git}"
  make -j1 -l release
}

check() {
  cd "${pkgname%-git}"
  make -j1 -l test
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 flisp "$pkgdir"/usr/bin/flisp
  install -Dm644 flisp.boot "$pkgdir"/usr/bin/flisp.boot
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/femtolisp-git/LICENSE
}
