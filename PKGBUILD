pkgname=awl-git
_pkgname=awl
pkgdesc="a from source package manager"
pkgver=r34.6fc74ae
pkgrel=1
arch=('x86_64')
url="https://codeberg.org/nzuum/awl"
license=('GPL2')
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
  make
}

package() {
  cd "$srcdir/$_pkgname" 
  install -Dm755 bin/awl "${pkgdir}/usr/bin/awl"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
