# Maintainer: Guoyi Zhang <myname at malacology dot net>

pkgname=fastme
_pkgname=FastME
pkgver=2.1.6.3
pkgrel=1
arch=('x86_64')
pkgdesc="a comprehensive, accurate and fast distance-based phylogeny inference program \
	 https://doi.org/10.1093/molbev/msv150"
url='http://www.atgc-montpellier.fr/fastme/usersguide.php'
license=('GPL3')
depends=('gcc-libs' 'glibc')
makedepends=('make' 'autoconf')
source=("${pkgname}-${pkgver}.tgz::https://gite.lirmm.fr/atgc/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha1sums=('a643d3943816369c6f07ef0092ccafb5820f7063')

prepare() {
  cd $srcdir/$_pkgname-v$pkgver
  autoupdate
  autoreconf -i
  ./configure --prefix=/usr
}

build() {
  cd $srcdir/$_pkgname-v$pkgver
  make
}

package() {
  cd $srcdir/$_pkgname-v$pkgver
  # binary
  make DESTDIR="${pkgdir}" install
  # docs
  install -Dm 644 doc/*.pdf $pkgdir/usr/share/doc/$pkgname/manual.pdf  
}
