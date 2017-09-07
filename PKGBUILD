# Contributor: Stephen Diehl <sdiehl at clarku dot edu>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=coffee-script-git
pkgver=1.12.7.4.ge7073bc5
pkgrel=1
pkgdesc='Language that compiles into JavaScript'
arch=('any')
url=http://coffeescript.org
license=('custom')
depends=('nodejs')
makedepends=('npm')
provides=('coffee-script')
conflicts=('coffee-script')
source=(git://github.com/jashkenas/coffee-script.git)
md5sums=('SKIP')
_gitname='coffee-script'

pkgver() {
  cd ${pkgname%-git}
  git describe --tags |sed 's/-/./g'
}

package() {
  cd ${pkgname%-git}
  npm install -g --user root --prefix "$pkgdir"/usr
  rm -r "$pkgdir"/usr/etc
  install -Dm644 "$srcdir"/$_gitname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  rm $pkgdir/usr/bin/{coffee,cake}
  rm $pkgdir/usr/lib/node_modules/${pkgname%-git}
  install -Dm755 bin/coffee $pkgdir/usr/bin/coffee
  install -Dm755 bin/cake $pkgdir/usr/bin/cake
  cp -r $srcdir/${pkgname%-git} $pkgdir/usr/lib/node_modules/${pkgname%-git}
  rm -rf $pkgdir/usr/lib/node_modules/${pkgname%-git}/.git
}
