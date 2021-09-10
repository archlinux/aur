# Maintainer: Muhammad Samir Al-Sawalhy <ms.2052001@gmail.com>
pkgname=mkjson-git
pkgver=0.3.0.r14.a5fdcf8
pkgrel=1
pkgdesc="A commandline tool to generate static or random JSON records"
url="https://github.com/mfussenegger/mkjson"
arch=('any')
license=('MIT')
depends=()
makedepends=('git' 'stack')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/mfussenegger/mkjson")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  stack build
}

package() {
  cd "$srcdir/${pkgname%-git}"/.stack-work/install/*/*/*/
  install -Dm +x ./bin/* -t "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/usr/share/doc/"
  cp -r ./doc/* "$pkgdir/usr/share/doc/"
}
