# Maintainer: Andrew Vos <andrew at andrewvos dot com>
pkgname=vbar-git
pkgver=r14.27777f3
pkgrel=1
pkgdesc="A bar"
arch=('any')
url="https://github.com/AndrewVos/vbar"
license=()
depends=()
makedepends=('git' 'vala')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+https://github.com/AndrewVos/vbar.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 vbar "$pkgdir/usr/bin/vbar"

  mkdir -p "$pkgdir/usr/share/doc/vbar/examples"
  install -Dm644 examples/vbar.json "$pkgdir/usr/share/doc/vbar/examples/vbar.json"
}

