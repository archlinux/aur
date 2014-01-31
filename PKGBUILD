# $Id: PKGBUILD 68685 2012-03-31 16:54:07Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Christian Babeux <christian.babeux@0x80.ca>

_distname=gambc-v4_7_1
pkgname=gambit-c
pkgver=4.7.1
pkgrel=2
pkgdesc='Scheme R5RS interpreter and compiler (via C)'
arch=('x86_64' 'i686')
url='http://dynamo.iro.umontreal.ca/wiki/index.php/Main_Page'
license=('LGPL2.1' 'Apache')
source=(http://www.iro.umontreal.ca/~gambit/download/gambit/v4.7/source/${_distname}.tgz)

build() {
  cd "$_distname"

  ./configure --prefix=/usr --docdir=/usr/share/doc/gambit-c \
    --infodir=/usr/share/info --libdir=/usr/lib/gambit-c \
    --enable-gcc-opts --enable-single-host
  make
}

package() {
  make -C "$_distname" install DESTDIR="$pkgdir"
  # gsc conflicts with the one provided by ghostscript
  mv "$pkgdir/usr/bin/gsc" "$pkgdir/usr/bin/gambitc"
  ln -sf /usr/bin/gambitc "$pkgdir/usr/bin/gsc-script"
}

# vim:set ts=2 sw=2 et:
