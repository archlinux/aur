# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# contributor: alzen<mynick2(at)gmail(dot)com>

pkgname=fbnews
pkgver=0.5
pkgrel=7
pkgdesc="fbnews is an RSS/RDF newsfetcher for Fluxbox"
arch=('any')
url="http://www.fms-engel.de/fbnews/index.php?page=home"
license=('GPL')
depends=('fluxbox' 'python2')
makedepends=('automake' 'pkgconfig' 'texinfo')
install='fbnews.install'
source=(http://www.fms-engel.de/fbnews/uploads/releases/fbnews-$pkgver.tar.gz)
md5sums=('6694bbdaa50f8a76bf6b5bb5157b0427')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  export INFODIR="$pkgdir"/usr/share/info

  # python2 fix
  for file in *.py; do
      sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
      sed -i 's_#!/usr/bin/python_#!/usr/bin/python2_' $file
  done

  sed -i 's|iso8859_15|utf8|' fbnews.py

  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/{fbnews,info}

  make INSTALLPREFIX="$pkgdir"/usr install

  ln -sf ../share/fbnews/fbnews.py "$pkgdir"/usr/bin/fbnews
  ln -sf ../share/fbnews/startmoz.sh "$pkgdir"/usr/bin/startmoz
}
