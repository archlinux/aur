# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=redshift-qt
pkgver=0.6
pkgrel=2
pkgdesc="redshift-gtk rewrite with C++/Qt"
arch=('x86_64' 'i686')
url="https://github.com/Chemrat/redshift-qt"
license=('MIT')
depends=('qt5-base' 'redshift')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('f240f5efa7d5e1aec4b4dee0e7b14b3097147d1a601afef27c33eaec06df9a8ed340f26b56b27e0c012717451b5b3f7e2d45ef59c85a6512f98b5e613fb397af')

prepare() {
  sed -i -E "s|Name=Redshift|Name=Redshift Qt|g" $pkgname-$pkgver/data/$pkgname.desktop
}

build() {
  cd $pkgname-$pkgver
  qmake $pkgname.pro
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 data/$pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm755 $pkgname -t "$pkgdir/usr/bin"
}
