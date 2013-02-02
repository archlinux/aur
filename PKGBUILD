# Maintainer: Matt Harrison <matt@mistbyte.com>
# Contributor: Sagar Chalise <chalisesagar@gmail.com>
# This PKGBUILD is maintained at https://github.com/matt-h/aur-pkgbuilds/tree/master/geany-zencoding

pkgname=geany-zencoding
pkgver=0.22
pkgrel=1
pkgdesc="Zen Coding plugin for geany"
arch=('x86_64' 'i686')
url="https://github.com/codebrainz/geany-zencoding"
license=('GPL')
depends=('geany' 'python2')
makedepends=('intltool')
_gitversion="026cd851af95527b766ee3e73a0394ee164cc2bf"
source=("https://github.com/codebrainz/geany-zencoding/archive/$_gitversion.tar.gz")
sha256sums=('7a9e3fdd754970931e679cd2306cfdbb72b7ee7899cc65b939a15cc4d2865927')

build() {
  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find "$srcdir/geany-zencoding-$_gitversion/" -name '*.py')
  sed -i 's/\[python\]/\[python2\]/g' $srcdir/geany-zencoding-$_gitversion/configure.ac

  cd "$srcdir/geany-zencoding-$_gitversion/"
  ./autogen.sh
  ./configure --prefix=`pkg-config --variable=prefix geany`
  make
}

package() {
  cd "$srcdir/geany-zencoding-$_gitversion/"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
