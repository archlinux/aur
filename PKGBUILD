# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=templates_parser
pkgdesc='Ada tools to create templated text streams, such as dynamic HTML documents.'
pkgver=25.0w
pkgrel=1

url=https://github.com/AdaCore/templates-parser
arch=(i686 x86_64)
license=(Apache)

depends=(gnatcoll-gmp langkit)
makedepends=(gprbuild
             python-setuptools
             python-mako
             python-funcy
             python-e3-core
             python-docutils
             python-sphinx
             python-sphinx_rtd_theme
             texlive-binextra)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources-2024/$pkgname-$pkgver-20240408-16376-src.tar.gz)
sha256sums=(65231004bed392fea5abbab64993046e2a73e8419dc44bfa80018d295d211c91)


build()
{
  cd $srcdir/$pkgname-$pkgver-20240505-1653B-src

  PROCESSORS=0 \
  make DEFAULT_LIBRARY_TYPE=relocatable prefix=$pkgdir/usr setup

  PROCESSORS=0 \
  make

  make build-doc
}


package()
{
  cd $srcdir/$pkgname-$pkgver-20240505-1653B-src

  make install

  # Install the licenses.
  #
  install -D -m644   \
     COPYING3        \
     $pkgdir/usr/share/licenses/$pkgname/COPYING3

  install -D -m644   \
     COPYING.RUNTIME \
     $pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME
}