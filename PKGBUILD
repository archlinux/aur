# Maintainer: Filipe Verri <filipeverri@gmail.com>

pkgname=type_safe-git
pkgver=0.1.r63.g8c92896
pkgrel=1
pkgdesc="Zero overhead utilities for preventing bugs at compile time"
arch=('any')
url="https://github.com/foonathan/type_safe"
license=('MIT')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=('debug_assert-git')
source=('git+https://github.com/foonathan/type_safe.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  ( set -o pipefail
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  mkdir -p "$pkgdir/usr/include"
  cp -R "$srcdir/${pkgname%-git}/include/type_safe" "$pkgdir/usr/include"
  install -D -m644 "$srcdir/${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
