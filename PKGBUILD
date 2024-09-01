# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=clevo-indicator-git
pkgver=r42.b88e763
pkgrel=1
pkgdesc="Fan control indicator for Clevo laptops"
arch=('x86_64')
url="https://github.com/dbeniamine/clevo-indicator"
license=('Unlicense')
depends=('libappindicator-gtk3')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/dbeniamine/clevo-indicator.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  sed -i 's/sudo install -m 4750 -g adm $(TARGET)/install -Dm 4750 -g adm $(TARGET) -t/g' Makefile
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DSTDIR="$pkgdir/usr" install
}
