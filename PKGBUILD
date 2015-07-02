# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=php-magickwand
pkgver=1.0.9_2
pkgrel=1
pkgdesc="ImageMagick MagickWand API support for PHP"
arch=('i686' 'x86_64')
url="http://www.magickwand.org/"
license=('custom')
depends=('imagemagick' 'php')
source=(http://www.magickwand.org/download/php/MagickWandForPHP-${pkgver/_/-}.tar.gz \
        magickwand.ini)
md5sums=('76190a585a9f6b90c9884ebd150c64b3'
         'c9c4d87fe86686f3755083c3dfa29d2c')

build() {
  cd "$srcdir/MagickWandForPHP-${pkgver%%_*}"

  phpize
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/MagickWandForPHP-${pkgver%%_*}"
  make -k test
}

package() {
  cd "$srcdir/MagickWandForPHP-${pkgver%%_*}"
  make INSTALL_ROOT="$pkgdir/" install

  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -D -m644 "$srcdir"/magickwand.ini "$pkgdir"/etc/php/conf.d/magickwand.ini
}

# vim:set ts=2 sw=2 et:
