# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Patrick Bartels <p4ddy.b@gmail.com>

pkgname="fbpager-git"
pkgver=r7.8e0927e
pkgrel=2
pkgdesc="A virtual desktop pager for fluxbox (Development tree)"
url="http://www.fluxbox.org/fbpager"
license=('MIT')
arch=('i686' 'x86_64')
depends=('gcc-libs' 'libxrender')
makedepends=('git')
conflicts=('fbpager')
provides=('fbpager')
source=("$pkgname::git://git.fluxbox.org/fbpager.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
