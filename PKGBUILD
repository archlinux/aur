# Maintainer: Dafta <dafta007@gmail.com>
pkgname=feedindicator
pkgver=1.03
pkgrel=1
pkgdesc="RSS feed updates in the indicator/notification area"
arch=('any')
url="https://github.com/nicolas-raoul/Feedindicator"
license=('GPL3')
depends=('python2-feedparser' 'python2-configobj' 'python2-libappindicator' 'python2-notify' 'python2-gconf')
makedepends=('git' 'xdg-utils')
install=feedindicator.install

source=('git+https://github.com/nicolas-raoul/feedindicator.git')
md5sums=('SKIP')
_gitname=feedindicator

prepare() {
  # adjust shebang
  cd "$srcdir/$_gitname"
  sed -i -e '1 s%^.*$%#!/usr/bin/python2.7%' feedindicator
}

package() {
  cd "$srcdir/$_gitname"

  mkdir -p $pkgdir/usr/share/feedindicator

  cp feedindicator-icon.png $pkgdir/usr/share/feedindicator/feedindicator-icon.png
  cp feedindicator-logo.png $pkgdir/usr/share/feedindicator/feedindicator-logo.png
  cp feedindicator-48x48.png $pkgdir/usr/share/feedindicator/feedindicator-48x48.png
  cp feedindicator.desktop $pkgdir/usr/share/feedindicator/feedindicator.desktop
  cp -r languages/ $pkgdir/usr/share/feedindicator/
  cp -r dark/ $pkgdir/usr/share/feedindicator/
  cp -r light $pkgdir/usr/share/feedindicator/
  cp -r hicolor $pkgdir/usr/share/feedindicator/

  mkdir -p $pkgdir/usr/bin

  cp feedindicator $pkgdir/usr/bin/feedindicator
  chmod +x $pkgdir/usr/bin/feedindicator
}
