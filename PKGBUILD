# Maintainer: David Scholl <djscholl at gmail dot com>
pkgname=sgi-fonts
pkgver=1.0.1
pkgrel=7
pkgdesc="Bitmapped X11 screen fonts from Silicon Graphics, Inc."
arch=('any')
url="http://oss.sgi.com/projects/sgi_propack/"
license=('MIT')
depends=('fontconfig' 'xorg-font-utils' 'xorg-fonts-encodings')
makedepends=('imake')
install=sgi-fonts.install
source=(http://download.opensuse.org/repositories/openSUSE:/13.2/standard/src/sgi-bitmap-fonts-1.0-943.1.5.src.rpm sgi-fonts.patch)
md5sums=('2995971cd23f914df9f745f1117ff5fb' 'a7f1df8c2d785c859ae60eb1c5742407')

build() {
  cd $srcdir
  tar xf sgi-fonts.tar.bz2
  patch -p0 < sgi-fonts.patch
  cd $pkgname
  xmkmf
  sed '/^          FONTDIR = /s/${datarootdir}\/fonts\/X11/\/usr\/share\/fonts/' -i Makefile
  sed '/^      FONTROOTDIR = /s/${datarootdir}\/fonts\/X11/\/usr\/share\/fonts/' -i Makefile
  make
}
package() {
  cd $srcdir/$pkgname
  make DESTDIR=$pkgdir install
  cd $pkgdir/usr/share/fonts/misc
  mv sgi/*.pcf.gz ./
  rm -Rf sgi
}
