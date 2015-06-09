# Maintainer : Marcos Heredia <chelqo@gmail.com>
# Contributor: yury <polek_yury@ukr.net>

pkgname=pdfchain
pkgver=0.4.4
pkgrel=1
pkgdesc="PDF Chain is a Graphical User Interface for the PDF Tool Kit"
url="http://pdfchain.sourceforge.net/"
screenshot="http://pdfchain.sourceforge.net/images/screenshots/${pkgver}/pdfchain_-_title.png"
license="GPL"
install=pdfchain.install
arch=('i686' 'x86_64')
depends=('pdftk' 'gtkmm3' 'fontconfig' 'libpng')
makedepends=('intltool' 'atkmm' 'glibmm')
source=("http://sourceforge.net/projects/pdfchain/files/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "POTFILES.skip")
md5sums=('7efed6b99e90bc4d43c17181903ef2c3'
         'b16ca527af3a13ec163c86927555f125')

build() {
  cd $srcdir/$pkgname-$pkgver
  cp $startdir/POTFILES.skip po/
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make prefix=$pkgdir/usr install

  install -dpm755 "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dpm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/"

  install -dpm755 "$pkgdir/usr/share/doc/$pkgname/"
  install -Dpm644 AUTHORS ChangeLog INSTALL README "$pkgdir/usr/share/doc/$pkgname/"
  cd $pkgdir/usr/share/doc/$pkgname/ ; rm COPYING NEWS

  echo "Comment[es]=Interface grafica para el PDF Toolkit (pdftk)" >>$pkgdir/usr/share/applications/pdfchain.desktop
}
