pkgname=pluto-find-orb-git
pkgver=r2399.b2cebb1
pkgrel=2
pkgdesc="Orbit determination from observations"
arch=(x86_64)
url="https://www.projectpluto.com/find_orb.htm"
license=(GPL2)
makedepends=('git' 'pluto-lunar' 'pluto-sat-code' 'pluto-jpl-eph')
install=find-orb.install
source=("git+https://github.com/Bill-Gray/find_orb.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/find_orb"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/find_orb"
  make
}

package() {
  cd "$srcdir/find_orb"
  make install
  install -m755 -D "${srcdir}/find_orb/find_orb"	"$pkgdir/usr/bin/find_orb"
  install -m755 -D "${srcdir}/find_orb/fo"		"$pkgdir/usr/bin/fo"
}
