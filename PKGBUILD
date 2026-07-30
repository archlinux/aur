pkgname=aruu-git
_pkgname=aruu
pkgdesc="Actual replacement for Busybox"
pkgver=r58.175955d
pkgrel=1
arch=('x86_64')
url="https://github.com/xplshn/aruu"
license=('ISC')
depends=()
makedepends=('git')
source=(git+$url.git)
sha512sums=('SKIP')
provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  make box
}

package() {
  cd "$srcdir/$_pkgname" 
  install -Dm755 aruu-box "$pkgdir/usr/bin/aruu-box"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
