#Maintainer: Guoyi Zhang <myname at malacology dot net>
#Contributor: Fabio Zanini <fabio DOOT zanini AAT fastmail DOOT fm>

pkgname=aliview
_pkgname=AliView
pkgver=1.30
pkgrel=1
pkgdesc="Software for aligning viewing and editing dna/aminoacid sequences https://doi.org/10.1093/bioinformatics/btu531"
arch=('any')
url="http://www.ormbunkar.se/aliview/"
license=('GPL')
depends=('java-runtime')
makedepends=('maven' 'java-environment')
source=("$pkgname.tar.gz::https://github.com/AliView/AliView/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3ed6af471a2e5c77355c1a0d06a31e44478a84ee93cb15b7295861549b5332f7')

build(){
  cd $srcdir/$_pkgname-$pkgver
  mvn package -Dmaven.test.skip=true
}

package(){
  cd $srcdir/$_pkgname-$pkgver
  cd aliview-linux
  install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm 644 $_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
  install -Dm 755 aliicon_128x128.png $pkgdir/usr/share/$pkgname/aliicon_128x128.png
  cd $srcdir/$_pkgname-$pkgver
  cd target
  install -Dm 755 $pkgname.jar $pkgdir/usr/share/$pkgname/$pkgname.jar
}
