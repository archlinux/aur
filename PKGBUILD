# Mantainer: Tomas K. <georgo10@gmail.com>

pkgname=php56-twig
pkgver=1.24.1
pkgrel=1
pkgdesc='PHP Twig extension.'
url='http://github.com/twigphp/Twig'
license=('BSD')
arch=('any')
depends=('php56')
makedepends=('php56')
source=("https://github.com/twigphp/Twig/tarball/v${pkgver}")
backup=('etc/php56/conf.d/twig.ini')
md5sums=('db94a7202f268c26efb2721cda984d95')
_git_commit='2280b86'

build() {
  msg "Starting build"
  workdir=$srcdir/twigphp-Twig-${_git_commit}
  cd $workdir/ext/twig

  msg "Running phpize"
  phpize56
  ./configure --prefix=/usr --enable-twig --sysconfdir=/etc/php56 --with-php-config=/usr/bin/php-config56 
  make
}

package() {
  mkdir -p "$pkgdir"/{/usr/lib/php56/modules,/etc/php56/conf.d}

  echo "extension=twig.so" > "twig.ini"

  workdir=$srcdir/twigphp-Twig-${_git_commit}
  install -D -m755 ${workdir}/ext/twig/modules/twig.so ${pkgdir}/usr/lib/php56/modules/twig.so
  install -D -m644 twig.ini ${pkgdir}/etc/php56/conf.d/twig.ini
  install -D -m644 ${workdir}/LICENSE ${pkgdir}/usr/share/licenses/twig56/LICENSE
}

# vim:set ts=2 sw=2 et:
