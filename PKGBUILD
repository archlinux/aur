# Maintainer: Felix Schindler <aur at schindlerfmily dot de>
pkgname=fntsample
pkgver=4.1
pkgrel=1
pkgdesc="For making font samples that show Unicode coverage of the font and are similar in appearance to Unicode charts (includes pdfoutline)."
url=http://fntsample.sourceforge.net/
license=(GPL3)
arch=(i686 x86_64)
depends=(cairo fontconfig freetype2 glib2 pango unicode-character-database perl-pdf-api2 perl-libintl-perl)
source=(http://downloads.sourceforge.net/project/fntsample/fntsample/4.1/fntsample-4.1.tar.gz)
md5sums=('109aab88b4ea4a3a78ca415dff3df6f3')

build() {
  cd ${pkgname}-${pkgver}

  ./configure --prefix=${pkgdir}/usr --with-unicode-blocks=/usr/share/unicode-character-database/Blocks.txt

  make
}

package() {
  cd ${pkgname}-${pkgver}

  make install

  sed -i "s;${pkgdir};/;g" ${pkgdir}/usr/bin/pdfoutline
}
