# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=templates_parser
pkgdesc='A high performance semantic engine for the Ada programming language.'
pkgver=24.0w
pkgrel=1

url=https://github.com/AdaCore/libadalang
arch=(i686 x86_64)
license=(Apache)

depends=(gnatcoll-gmp langkit)
makedepends=(gprbuild
             python-setuptools
             python-mako
             python-funcy
             python-e3-core
             python-docutils
             python-sphinx)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources/$pkgname-$pkgver-20230324-1619B-src.tar.gz)
sha256sums=(52e0f2cd44d92d99c818628bf3dfd1d019b6c2e852a3dc5de6edd0dfda529fd6)


build()
{
  cd $srcdir/$pkgname-$pkgver-20230428-16620-src

  PROCESSORS=0 \
  make DEFAULT_LIBRARY_TYPE=relocatable prefix=$pkgdir/usr setup

  PROCESSORS=0 \
  make

  # Docs are currently broken due to missing 'sphinx_rtd_theme' python package.
  #
#  make build-doc
}


package()
{
  cd $srcdir/$pkgname-$pkgver-20230428-16620-src

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