#Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=ctwm-git
pkgver=3.8.2.r331.gca12ada
pkgrel=1
pkgdesc="Claude's Tab Window Manager"
arch=('i686' 'x86_64')		
url="http://ctwm.org/"
license=('custom:MIT/X Consortium')
provides=('ctwm')
conflicts=('ctwm')
depends=('libxmu' 'libxpm' 'libjpeg')
makedepends=('git' 'cmake')
backup=('usr/lib/X11/twm/system.ctwmrc')
source=("$pkgname::git+https://github.com/fullermd/ctwm-mirror.git"
        copyright)
md5sums=('SKIP'
         '27dfbec8866ff55e54f6232a2d2d2de8')

pkgver() {
  cd $pkgname
  git describe --long --tags --match 'ctwm-*' | sed -r 's,^ctwm-,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

build() {
  cd $pkgname
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd $pkgname
  cd build
  sed -e 's,/lib64/,/lib/,g' -i cmake_install.cmake
  make DESTDIR="$pkgdir" install
  install -Dm0644 "$srcdir/copyright" "$pkgdir/usr/share/licenses/$pkgname/copyright"
}

# vim:set et sw=2:
