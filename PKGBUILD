# Maintainer: Victor Häggqvist <aur@snilius.com>

_pkgname=drupalconsole
pkgname=drupalconsole-git
pkgver=0.7.15.r81.g4e2a2b8
pkgrel=1
pkgdesc="The Drupal Console is a suite of tools that you run on a command line interface (CLI) to generate boilerplate code and interact with a Drupal 8 installation."
url="http://drupalconsole.com/"
license=('MIT')
arch=('any')
depends=('php' 'php-composer')
provides=('drupalconsole')
conflicts=('drupalconsole')
source=($pkgname::git+https://github.com/hechoendrupal/DrupalConsole.git)
sha512sums=('SKIP')
install="$_pkgname.install"

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  composer install
}

package() {
  install -dm755 "$pkgdir/opt/$_pkgname/"
  cp -a "$srcdir/$pkgname/." "$pkgdir/opt/$_pkgname"
  install -dm755 "$pkgdir/usr/bin"
  ln -s "$pkgdir/opt/$_pkgname/bin/console" "$pkgdir/usr/bin/drupal"

}

#package() {
#j  cd "$srcdir/rainbowstream-${pkgver}/"
 # python setup.py install --root="$pkgdir/" --optimize=1
#}

# vim: ts=2 sts=2 sw=2 et ft=sh
