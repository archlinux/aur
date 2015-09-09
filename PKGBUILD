# Mantainer: Bruno Galeotti <bgaleotti@gmail.com>

pkgname=php-twig
pkgver=1.21.2
pkgrel=1
pkgdesc='PHP Twig extension.'
url='http://github.com/twigphp/Twig'
license='BSD'
arch=('any')
depends=('php')
makedepends=('php')
source=("https://github.com/twigphp/Twig/tarball/v${pkgver}")
backup=('etc/php/conf.d/twig.ini')
sha256sums=('03f7018fc4f41d953d2cbbf56e1fe101fa646dbc833bfdd753b69b6172d22bef')
_git_commit='df56fa1'

build() {
  msg "Starting build"
  workdir=$srcdir/twigphp-Twig-${_git_commit}
  cd $workdir/ext/twig

  msg "Running phpize"
  phpize
  ./configure --prefix=/usr --enable-twig
  make
}

package() {
  mkdir -p "$pkgdir"/{/usr/lib/php/modules,/etc/php/conf.d}

  echo "extension=twig.so" > "twig.ini"

  workdir=$srcdir/twigphp-Twig-${_git_commit}
  install -D -m755 ${workdir}/ext/twig/modules/twig.so ${pkgdir}/usr/lib/php/modules/twig.so
  install -D -m644 twig.ini ${pkgdir}/etc/php/conf.d/twig.ini
  install -D -m644 ${workdir}/LICENSE ${pkgdir}/usr/share/licenses/twig/LICENSE
}

# vim:set ts=2 sw=2 et:
