# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=hilbifetch-git
pkgver=r24.23e6dbe
pkgrel=1
pkgdesc="Simple and small fetch written in Lua using Hilbish"
arch=('any')
url="https://github.com/hilbis/hilbifetch"
license=('BSD')
depends=('hilbish>=0.4.0')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="$pkgname.install"
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  install -Dvm 755 hilbifetch.lua "$pkgdir/usr/bin/hilbifetch"
  install -Dvm 644 hfconf.lua -t "$pkgdir/etc/"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
