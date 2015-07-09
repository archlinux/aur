# Maintainer: darkfeline@felesatra.moe

pkgname=non-sessionmanager-git
pkgver=r1798.18a299c
pkgrel=1
pkgdesc="Jack audio session manager from the NON DAW"
arch=('i686' 'x86_64')
url="http://non.tuxfamily.org/"
license=('GPL2')
provides='non-sessionmanager=$pkgver'
conflicts='non-sessionmanager'
depends=('ntk-git' 'jack' 'liblo')
makedepends=('git')
source=($pkgname'::git+git://git.tuxfamily.org/gitroot/non/non.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  ./waf configure --prefix=/usr --project=session-manager
  ./waf
}

package() {
  cd "$srcdir/$pkgname"
  ./waf --destdir="$pkgdir" install
}

