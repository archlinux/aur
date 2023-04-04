# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Alexandre G <alex foo lecairn bar org>

pkgname=figtree
_pkgname=Figtree
pkgver=1.4.4
pkgrel=10
pkgdesc='Graphical viewer of phylogenetic trees'
arch=('any')
url='http://tree.bio.ed.ac.uk/software/figtree'
license=('GPL2')  # as stated in http://code.google.com/p/figtree/
depends=('java-runtime=8')
makedepends=('java-environment=8' 'ant' 'git')
source=("git+https://github.com/rambaut/figtree.git#commit=f9085b6"
	"$_pkgname"
        "${pkgname}.desktop")
sha256sums=('SKIP'
            'd799ce29b41f4dcea53ab0337353b244c616a391b197862a9b2d7e0bb703e06d'
            'b254f6074855f01179ffde9a428617f172cdd75bd5d4ff99f97f59f48a0cd53f')

build() {
  cd $pkgname
  ant dist
}
package() {
  install -Dm 755 $srcdir/$_pkgname $pkgdir/usr/bin/$pkgname
  install -Dm 755 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  cd $srcdir/$pkgname
  install -Dm 755 dist/$pkgname.jar $pkgdir/usr/share/$pkgname/$pkgname.jar
  install -Dm 644 release/Linux/icons/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
