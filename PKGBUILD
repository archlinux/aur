# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=nyacc 
pkgver=0.79.4
pkgrel=1
pkgdesc="Not Yet Another Compiler Compiler"
url="http://www.nongnu.org/nyacc"
arch=('any')
license=('GPL' 'LGPL' 'FDL')
depends=('guile')
makedepends=()
source=(http://download.savannah.gnu.org/releases/nyacc/$pkgname-$pkgver.tar.gz package.patch)
sha256sums=('8407981c3b4a8d18df1742df80d54860029f9218eb2992eac94280b06dca3093'
            '90c25cd1f901c89e128dd1bab17aae5fae6b17e44198884a7a2450dff1dbe0c0')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 < "$srcdir"/package.patch || true
}

build() {
  cd $pkgname-$pkgver
  ./configure --site_scm_dir=/usr/share/guile/2.2 --site_scm_go_dir=/usr/lib/guile/2.2/ccache
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
