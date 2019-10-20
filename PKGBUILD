# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=nyacc 
pkgver=0.99.1
pkgrel=1
pkgdesc="Not Yet Another Compiler Compiler"
url="http://www.nongnu.org/nyacc"
arch=('any')
license=('GPL' 'LGPL' 'FDL')
depends=('guile')
makedepends=()
source=("http://download-mirror.savannah.gnu.org/releases/nyacc/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('5abdd03809cc377bb69a024b584d15a5ffb5e72a646802d88fdc597c37f35325'
            'SKIP')
validpgpkeys=('7C9EDA8DCE5DC8AE2C675EC9EE4F2A40097B7C03') # Marc Wette

build() {
  cd $pkgname-$pkgver
  GUILD=/usr/bin/guild ./configure 
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
