# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=bakonf
arch=('i686' 'x86_64')
pkgver=0.7.0
pkgrel=1
pkgdesc="Tool that creates a backup of selected configuration files and information about running system"
license=('GPL')
url="http://www.nongnu.org/bakonf/"
depends=('python' 'python-bsddb')
source=("https://github.com/iustin/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        "pacmandb.xml"
        "https://github.com/iustin/bakonf/commit/9d8018789bb8dcc9732c4e5b8753fa00378a7115.diff"
        "https://github.com/iustin/bakonf/commit/8ce5fb04bc9714083565bec9b12812ecb8a7d8ad.diff")
md5sums=('ed821712e4cdfdadfe43d9bfc0071359'
         'd98dc1a8d572b562214689f9e3ed0cd2'
         'da8e5322806f56dd46d53b2285e7c31e'
         '0bf5e2faae84da4fcc15df1ad0efd3b3')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  patch -p1 -i "${srcdir}/9d8018789bb8dcc9732c4e5b8753fa00378a7115.diff"
  patch -p1 -i "${srcdir}/8ce5fb04bc9714083565bec9b12812ecb8a7d8ad.diff"
}

package() {
  install -Dm644 $srcdir/pacmandb.xml $pkgdir/etc/bakonf/sources/pacmandb.xml
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir/ install
}
