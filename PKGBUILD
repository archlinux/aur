# Mantainer: Bruno Galeotti <bgaleotti@gmail.com>

pkgname=php-twig-git
pkgver=v1.21.2.r1.g7d21eb9
pkgrel=1
pkgdesc="PHP Twig extension."
url="http://twig.sensiolabs.org/"
license="BSD"
arch=("any")
depends=("php")
makedepends=("git" "php")
provides=("php-twig")
conflicts=("php-twig")
replaces=("php-twig")
backup=("etc/php/conf.d/twig.ini")
source=(git+https://github.com/twigphp/Twig.git)
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/Twig"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/Twig/ext/twig

  phpize
  ./configure --prefix=/usr --enable-twig
  make
}

package() {
  mkdir -p "$pkgdir"/{/usr/lib/php/modules,/etc/php/conf.d}

  echo ";extension=twig.so" > "twig.ini"

  install -Dm744 $srcdir/Twig/ext/twig/modules/twig.so $pkgdir/usr/lib/php/modules/twig.so
  install -Dm644 twig.ini $pkgdir/etc/php/conf.d/twig.ini
}

# vim:set ts=2 sw=2 et:
