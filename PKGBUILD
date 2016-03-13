#Maintainer: David McInnis <davidm@eagles.ewu.edu>
#Contributer: André Silva <emulatorman@parabola.nu>
#Contributer: Márcio Silva <coadde@parabola.nu>

_pkgname=jquery
pkgname=jquery-ui
pkgver=1.11.4
pkgrel=1
pkgdesc='jQuery UI provides abstractions for low-level interaction and animation, advanced effects and high-level, themeable widgets, built on top of the jQuery JavaScript Library, that you can use to build highly interactive web applications'
arch=('any')
url='http://jqueryui.com/'
license=('MIT')
depends=('jquery')
makedepends=('npm' 'nodejs-grunt-cli')

source=("https://github.com/$_pkgname/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('5d6035c1d802667a4d1f56b4c7f40aff142ae46ed462de9dacb7687ad705a4c0')

build() {
  cd $srcdir/$pkgname-$pkgver
  npm install
  grunt concat:ui uglify:main
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -d $pkgdir/usr/share/javascript/$pkgname
  install -d $pkgdir/usr/share/licenses/$pkgname
  cp -a dist/* $pkgdir/usr/share/javascript/$pkgname
  cp -a LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
