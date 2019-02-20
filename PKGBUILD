# Maintainer: Ray Rashif <schiv@archlinux.org>
# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>

pkgname=elyxer
pkgver=1.2.5
pkgrel=4
pkgdesc="A LyX to HTML converter"
url="http://alexfernandez.github.io/elyxer/"
arch=('any')
license=('GPL3')
depends=('python2')
source=("http://alexfernandez.github.com/elyxer/dist/$pkgname-$pkgver.tar.gz")
sha512sums=('3dc8f5aac635f881c117b8bfb90627314a5c4733648f359d404c6690416538e64c575153db6a8748ca9799729249c126f4628c7fd3590085a974a2d0615ba377')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # python2 fix (copyleftrightupdown Allan McRae 2010)
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
         -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
         $(find . -name '*.py')

  # might not be needed, but can't hurt -- kevin
  sed -i "s|('#! /usr/bin/env python')|('#! /usr/bin/env python2')|" \
    src/elyxer/conf/fileconfig.py
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
