# Contributor: Stephen Diehl <sdiehl at clarku dot edu>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=coffee-script-git
pkgver=1.9.3.7.g2d1a6fa
pkgrel=1
pkgdesc='Language that compiles into JavaScript'
arch=any
url=http://coffeescript.org
license=('custom')
depends=('nodejs' 'underscorejs')
provides=('coffee-script')
conflicts=('coffee-script')
source=(git://github.com/jashkenas/coffee-script.git)
md5sums=('SKIP')
_gitname='coffee-script'

pkgver() {
  cd "$srcdir"/$_gitname
  git describe --tags |sed 's/-/./g'
}

package() {
  cd $_gitname
  export NODE_PATH=/usr/share/underscorejs:$NODE_PATH
  install -d $pkgdir/usr/lib/node_modules
  bin/cake --prefix "$pkgdir/usr/" install
  cp -r $pkgdir/usr/lib/coffee-script $pkgdir/usr/lib/node_modules/
  rm -rf $pkgdir/usr/lib/coffee-script
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  rm -rf $pkgdir/usr/bin/cake $pkgdir/usr/bin/coffee &&
  ln -s /usr/lib/node_modules/coffee-script/bin/coffee $pkgdir/usr/bin/coffee &&
  ln -s /usr/lib/node_modules/coffee-script/bin/cake $pkgdir/usr/bin/cake
}
