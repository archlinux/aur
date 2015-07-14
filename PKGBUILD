# Maintainer: darkfeline@felesatra.moe

pkgname=non-sessionmanager-git
pkgver=1.1.0.r685.g18a299c
pkgrel=1
pkgdesc="Jack audio session manager from the NON DAW"
arch=('i686' 'x86_64')
url="http://non.tuxfamily.org/"
license=('GPL2')
provides='non-sessionmanager'
conflicts='non-sessionmanager'
depends=('ntk-git' 'jack' 'liblo')
makedepends=('git')
source=($pkgname'::git+git://git.tuxfamily.org/gitroot/non/non.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/^non-daw-v//;s/-/./g'
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

