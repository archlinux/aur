# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=nyacc 
pkgver=0.83.3
pkgrel=1
pkgdesc="Not Yet Another Compiler Compiler"
url="http://www.nongnu.org/nyacc"
arch=('any')
license=('GPL' 'LGPL' 'FDL')
depends=('guile')
makedepends=()
source=("http://download-mirror.savannah.gnu.org/releases/nyacc/$pkgname-$pkgver.tar.gz")
sha256sums=('a6654a1052a93089a193d14ec5815048178f396c4400260943259bd52ab04004')

build() {
  cd $pkgname-$pkgver
  GUILD=/usr/bin/guild ./configure --site_scm_dir=/usr/share/guile/2.2 \
       --site_scm_go_dir=/usr/lib/guile/2.2/ccache 
  make
}
 
package() {
  cd $pkgname-$pkgver
  make SITE_SCM_DIR=$pkgdir/usr/share/guile/2.2/ \
       SITE_SCM_GO_dir=$pkgdir/usr/lib/guile/2.2/ccache install-srcs
  install -d $pkgdir/usr/share/doc/$pkgname
  cd doc/$pkgname
  cp nyacc*.{pdf,html} $pkgdir/usr/share/doc/$pkgname
}
