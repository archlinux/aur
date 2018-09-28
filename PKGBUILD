# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=nyacc 
pkgver=0.86.1
pkgrel=1
pkgdesc="Not Yet Another Compiler Compiler"
url="http://www.nongnu.org/nyacc"
arch=('any')
license=('GPL' 'LGPL' 'FDL')
depends=('guile')
makedepends=()
source=("http://download-mirror.savannah.gnu.org/releases/nyacc/$pkgname-$pkgver.tar.gz")
sha256sums=('ab4a8b5dc9a038ed9ae63a33f9f4070726b00425409749e9bb5ec60ed95265ed')

build() {
  cd $pkgname-$pkgver
  GUILD=/usr/bin/guild ./configure --site_scm_dir=/usr/share/guile/2.2 \
       --site_scm_go_dir=/usr/lib/guile/2.2/ccache 
  make
}
 
package() {
  cd $pkgname-$pkgver
  make SITE_SCM_DIR="$pkgdir"/usr/share/guile/2.2/ \
       SITE_SCM_GO_dir="$pkgdir"/usr/lib/guile/2.2/ccache install-srcs
  install -d "$pkgdir"/usr/share/doc/$pkgname
  cd doc/$pkgname
  cp nyacc*.{pdf,html} "$pkgdir"/usr/share/doc/$pkgname
}
