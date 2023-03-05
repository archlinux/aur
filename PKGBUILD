# Maintainer: WaffleFrisbee <dev at tyka dot tech>
# Contributor: kaptoxic at yahoo com
# Contributor: Henrik Hallberg <halhen at k2h dot se>
pkgname=smu-karlb-git
pkgver=1.5.r75.gbd03c59
pkgrel=1
pkgdesc="A simplified markdown dialect and interpreter"
url="https://github.com/karlb/smu"
arch=('i686' 'x86_64')
license=('MIT')
conflicts=('smu')
provides=('smu')
options=(zipman)
depends=('glibc')
source=("$pkgname::git+https://github.com/karlb/smu.git")
sha1sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR=$pkgdir
}

package() {
  cd $pkgname
  make PREFIX=/usr MANPREFIX=/usr/share/man DESTDIR=$pkgdir install || return 1
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}