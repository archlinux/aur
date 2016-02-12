# Maintainer: Gunther Schulz <forum (at) guntherschulz.de>

pkgname=dcled
pkgver=stable.1.9.kost.r4.gc819fec
_pkgver=1.9
pkgrel=2
pkgdesc='dcled - userland driver for Dream Cheeky (Dream Link?) USB LED Message Board'
url='https://github.com/kost/dcled'
license=('GPL')
arch=('i686' 'x86_64')
depends=('libhid'
         )
makedepends=('make'
             'git')
provides=("$pkgname=$pkgver")
source=("${pkgname}::git://github.com/kost/dcled.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^final-//;s/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g'
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname

  install -Dm755 $srcdir/$pkgname/dcled \
    "$pkgdir/usr/bin/dcled"

  install -Dm644 $srcdir/$pkgname/40-dcled.rules \
    "$pkgdir/etc/udev/rules.d/40-dcled.rules"
}
