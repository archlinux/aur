# Maintainer:  shuall <me@shuall.biz>

_pkgname=slmenu
pkgname=$_pkgname-git
pkgver=r10.18075ad
pkgrel=1
pkgdesc="single line menu"
url="https://github.com/adriangrigore/slmenu.git"
arch=('i686' 'x86_64')
license=('MIT')
depends=('sh')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=(git+https://github.com/adriangrigore/$_pkgname)
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
  cd $_pkgname
  make \
    X11INC=/usr/include/X11 \
    X11LIB=/usr/lib/X11
}

package() {
  cd $_pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
