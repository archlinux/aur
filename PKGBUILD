# Maintainer: darkfeline@felesatra.moe

pkgname=non-mixer-git
pkgver=r1798.18a299c
pkgrel=1
pkgdesc="mixer from the NON family"
arch=('x86_64' 'i686')
url="http://non.tuxfamily.org/"
license=('GPL')
groups=()
provides='non-mixer'
conflicts='non-mixer'
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
  ./waf configure --prefix=/usr --project=mixer
  ./waf
}

package() {
  cd "$srcdir/$pkgname"
  ./waf install --destdir="$pkgdir"
}
