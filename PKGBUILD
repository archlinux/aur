# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=nyacc 
pkgver=0.86.2
pkgrel=1
pkgdesc="Not Yet Another Compiler Compiler"
url="http://www.nongnu.org/nyacc"
arch=('any')
license=('GPL' 'LGPL' 'FDL')
depends=('guile')
makedepends=()
source=("http://download-mirror.savannah.gnu.org/releases/nyacc/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('fea933335a832e1d1c33686ddbe8301fddb4b595c327321e08a6883b4e1e8ec4'
            'SKIP')
validpgpkeys=('7C9EDA8DCE5DC8AE2C675EC9EE4F2A40097B7C03') # Marc Wette

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
