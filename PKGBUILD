# Maintainer: Filipe Verri <filipeverri@gmail.com>

pkgname=debug_assert-git
pkgver=r5.0fa4470
pkgrel=1
pkgdesc="Simple, flexible and modular assertion macro"
arch=('any')
url="https://github.com/foonathan/debug_assert"
license=('MIT')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/foonathan/debug_assert.git')
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
  cp "$srcdir/${pkgname%-git}/debug_assert.hpp" "$pkgdir/usr/include"
}
