# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Alexandre G <alex foo lecairn bar org>

pkgname=figtree
_pkgname=Figtree
pkgver=1.4.4
pkgrel=5
pkgdesc='Graphical viewer of phylogenetic trees'
arch=('any')
url='http://tree.bio.ed.ac.uk/software/figtree'
license=('GPL2')  # as stated in http://code.google.com/p/figtree/
depends=('java-runtime=8')
makedepends=('java-environment' 'ant' 'git')
source=("git+https://github.com/rambaut/figtree.git#commit=f9085b6"
	"$_pkgname"
        "${pkgname}.desktop")
sha256sums=('SKIP'
            'd799ce29b41f4dcea53ab0337353b244c616a391b197862a9b2d7e0bb703e06d'
            '803d76b21ab1a8c300b5e5855022fb6309f1ce6b647308e254965790664d36b0')

build() {
  cd $pkgname
  ant dist
}
package() {
  install -Dm 755 $srcdir/$_pkgname $pkgdir/usr/bin/$pkgname
  install -Dm 755 $srcdir/$pkgname.desktop $pkgdir/usr/bin/$pkgname.desktop

  cd $srcdir/$pkgname
  install -Dm 755 dist/$pkgname.jar $pkgdir/usr/share/$pkgname/$pkgname.jar
  install -Dm 644 release/Linux/icons/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
