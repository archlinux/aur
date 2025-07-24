# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=templates_parser
pkgdesc='Ada tools to create templated text streams, such as dynamic HTML documents.'
pkgver=26.0w
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

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2025/templates_parser-26.0w-20250409-163F7-src.tar.gz)
sha256sums=(8d182b3fb6d630668dae8203eb2a8fe2db692c40d83dde344192590339f2ab1f)


build()
{
  cd $srcdir/templates_parser-26.0w-20250416-163C5-src

  PROCESSORS=0 \
  make DEFAULT_LIBRARY_TYPE=relocatable prefix=$pkgdir/usr setup

  PROCESSORS=0 \
  make

  make build-doc                  \
       1> build-docs-warnings.log \
       2> build-docs-errors.log 
}


package()
{
  cd $srcdir/templates_parser-26.0w-20250416-163C5-src

  make -j1 install

  # Install the licenses.
  #
  install -D -m644   \
     COPYING3        \
     $pkgdir/usr/share/licenses/$pkgname/COPYING3

  install -D -m644   \
     COPYING.RUNTIME \
     $pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME
}