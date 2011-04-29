# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Francis Carroll (franciscarroll at gmail dot com)

pkgname=splix
pkgver=2.0.0
pkgrel=9
pkgdesc="CUPS drivers for SPL (Samsung Printer Language) printers"
arch=('i686' 'x86_64')
url="http://splix.ap2c.org/"
license=('GPL')
depends=('libcups' 'gcc-libs' 'ghostscript>=9.02')
makedepends=('libcups' 'jbigkit' 'krb5')
install=splix.install
source=(http://downloads.sourceforge.net/splix/$pkgname-$pkgver.tar.bz2)
md5sums=('f3aa735c22a926818b3d8b26c9964186')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i 's#const PPDFile::Value::Value #const PPDFile::Value #' src/ppdfile.cpp

  make PSTORASTER=gstoraster 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -d "$pkgdir/usr/lib/cups/filter"
  install -d "$pkgdir/usr/share/cups/model/samsung"

  make DESTDIR="$pkgdir" install
}
