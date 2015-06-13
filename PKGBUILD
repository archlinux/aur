# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=phyml-git
pkgver=r121.ab59039
pkgrel=1
pkgdesc="Phylogenetic estimation using (Maximum) Likelihood"
arch=('i686' 'x86_64')
url="https://github.com/stephaneguindon/phyml/"
license=('GPL2')
depends=('glibc')
conflicts=('phyml')
provides=('phyml')

source=("$pkgname::git+https://github.com/stephaneguindon/phyml")

md5sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/$pkgname

  autoreconf -fi
}

build() {
  cd $srcdir/$pkgname

  ./configure \
    --prefix=/usr \
    --disable-static

  make
}

package() {
  cd $srcdir/$pkgname

  make DESTDIR=$pkgdir install
}
