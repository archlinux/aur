# Maintainer: 2ion <dev@2ion.de>
pkgname=xonstat-git
pkgver=r11.7ffddb2
pkgrel=1
pkgdesc="Query script for stats.xonotic.org"
arch=('any')
url="https://github.com/2ion/xonstat"
license=('GPL3')
depends=('bash' 'jq' 'coreutils')
makedepends=('git' 'bash')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/2ion/xonstat.git#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd "$srcdir/${pkgname%-git}"
  bash -n xonstat
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 xonstat "$pkgdir"/usr/bin/xonstat
  install -Dm644 LICENSE "$pkgdir"/usr/share/doc/xonstat/LICENSE
  install -Dm644 xonstat.1 "$pkgdir"/usr/share/man/man1/xonstat.1
}
