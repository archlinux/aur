# Maintainer: Daniel Sandman <revoltism@gmail.com>

pkgname=haveclip-core-git
pkgver=0.0.0
pkgrel=1
pkgdesc="A simple clipboard manager and synchronization tool (core pkg)"
arch=('i686' 'x86_64')
url="http://www.havefun.cz/projects/haveclip/"
license=('GPL')
depends=('qt4')
makedepends=('make' 'gcc' 'xproto' 'qca' 'qca-ossl')
conflicts=('haveclip' 'haveclip-core-git')
provides=('haveclip-core')
source=("$pkgname"::'git+https://github.com/aither64/haveclip-core.git#branch=master')
md5sums=('SKIP')

pkgver() {
     cd "$srcdir/$pkgname"
     git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}


build() {
  cd "$srcdir/$pkgname"
  /usr/lib/qt4/bin/qmake
  make || return 1
}

package() {
  cd "$srcdir/$pkgname/bin"
  install -Dm755 libhaveclipcore.so.1.0.0 "$pkgdir/usr/lib/libhaveclipcore.so.1.0.0"
  ln -s libhaveclipcore.so.1.0.0 $pkgdir/usr/lib/libhaveclipcore.so
  ln -s libhaveclipcore.so.1.0.0 $pkgdir/usr/lib/libhaveclipcore.so.1
  ln -s libhaveclipcore.so.1.0.0 $pkgdir/usr/lib/libhaveclipcore.so.1.0

}

