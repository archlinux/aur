# Maintainer: Ashutosh Padelkar <a dot padelkar 1 at gmail dot com> 
pkgname=tempo-git
pkgver=rf08960e
pkgrel=1
pkgdesc="Pulsar Timing Software"
arch=('i686' 'x86_64')
url="https://tempo.sourceforge.net/"
license=('GPL2')
makedepends=('git' 'tcsh')
provides=(${pkgname%-git})
backup=()
options=()
install=tempo-git.install
source=('tempo.cfg'
         'git://git.code.sf.net/p/tempo/tempo')
md5sums=('616816caf04a2a5bab7d9a148a0af736'
         'SKIP')


pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"

  ./prepare
  ./configure --prefix=/opt/tempo/
  make
}


check() {
  cd "$srcdir/${pkgname%-git}"
  make -k check
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir/" install

  cp -rv "$srcdir/${pkgname%-git}/clock" "$pkgdir/opt/tempo/clock"
  cp -rv "$srcdir/${pkgname%-git}/doc"   "$pkgdir/opt/tempo/doc"
  cp -rv "$srcdir/${pkgname%-git}/ephem" "$pkgdir/opt/tempo/ephem"
  cp -rv "$srcdir/${pkgname%-git}/test"  "$pkgdir/opt/tempo/test"
  cp -rv "$srcdir/${pkgname%-git}/tzpar" "$pkgdir/opt/tempo/tzpar"
  cp -rv "$srcdir/${pkgname%-git}/util"  "$pkgdir/opt/tempo/util"
  cp -v  "$srcdir/${pkgname%-git}/obsys.dat" "$pkgdir/opt/tempo/obsys.dat"
  cp -v  "$srcdir/${pkgname%-git}/tempo.cfg" "$pkgdir/opt/tempo/tempo.cfg"
  cp -v  "$srcdir/${pkgname%-git}/tempo.hlp" "$pkgdir/opt/tempo/tempo.hlp"
}
