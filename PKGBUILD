# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=nyacc 
pkgver=0.94.0
pkgrel=1
pkgdesc="Not Yet Another Compiler Compiler"
url="http://www.nongnu.org/nyacc"
arch=('any')
license=('GPL' 'LGPL' 'FDL')
depends=('guile')
makedepends=()
source=("http://download-mirror.savannah.gnu.org/releases/nyacc/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('c43a247f5b9ac9d9dbb6d7ee2caa562aa8a426171ea6bce0f9480e1b2aff168b'
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
