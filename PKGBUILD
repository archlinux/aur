# Maintainer: Denis Kasak <dkasak|AT|termina.org.uk>
# Maintainer: ChenPi11 <wushengwuxi-msctinoulk@outlook.com>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=gnulib-git
pkgver=v1.0.2313.g7eeb8077c6
pkgrel=1
pkgdesc="GNU Portability Library"
arch=('any')
url="http://www.gnu.org/software/gnulib"
license=('custom')
provides=("gnulib=${pkgver}")
replaces=("gnulib<=${pkgver}")
conflicts=('gnulib')
makedepends=('git')
source=('git+https://github.com/coreutils/gnulib')
md5sums=('SKIP')

pkgver() {
  cd "$SRCDEST/gnulib"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/gnulib"
  sed -i "/^[ ]*gnulib_dir=/s#\`[^\`]*\`#/usr/share/$pkgname#" gnulib-tool
  make info
}

package() {
  cd "$srcdir/gnulib"
  mkdir -p $pkgdir/usr/share/gnulib-git
  cp -r * $pkgdir/usr/share/gnulib-git
  cp .gnulib-tool.py $pkgdir/usr/share/gnulib-git

  install -dm755 $pkgdir/usr/bin
  ln -s /usr/share/gnulib-git/gnulib-tool $pkgdir/usr/bin/
  ln -s /usr/share/gnulib-git/gnulib-tool.sh $pkgdir/usr/bin
  ln -s /usr/share/gnulib-git/gnulib-tool.py $pkgdir/usr/bin
  ln -s /usr/share/gnulib-git/check-module $pkgdir/usr/bin/

  install -Dm644 doc/gnulib.info $pkgdir/usr/share/info/gnulib.info
  install -Dm644 COPYING $pkgdir/usr/share/licenses/${pkgname}/COPYING
}
