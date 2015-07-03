# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
pkgname=phar-gui-git
pkgver=86de446
pkgrel=1
pkgdesc="A graphical user interface to work with PHP Phar files."
arch=('any')
url="https://github.com/jgmdev/phar-gui"
license=('MIT')
depends=('php' 'php-wxwidgets-git')
makedepends=('git')
source=('git+https://github.com/jgmdev/phar-gui.git')
md5sums=('SKIP')

_gitname="phar-gui"

pkgver () {
  cd $srcdir/$_gitname
  echo $(git describe --always | sed 's/-/./g')
}

package() {
  cd $srcdir/$_gitname
  
  install -d "$pkgdir/usr/share/phar-gui"
  cp -r "lib" "$pkgdir/usr/share/phar-gui"
  cp -r "images" "$pkgdir/usr/share/phar-gui"
  install -Dm644 "main.php" "$pkgdir/usr/share/phar-gui/main.php"
  install -Dm644 "resources.php" "$pkgdir/usr/share/phar-gui/resources.php"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

  install -d "$pkgdir/usr/bin"
  echo "php /usr/share/phar-gui/main.php" > $pkgdir/usr/bin/phar-gui
  chmod +x $pkgdir/usr/bin/phar-gui
}

# vim:set ts=2 sw=2 et:
