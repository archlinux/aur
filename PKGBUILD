# Maintainer: Reuben <projectdelphai at gmail dot com>
# Contributor: Chad Aeschliman <chadaeschliman at gmail dot com>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=pybliographer
pkgver=1.2.16
pkgrel=1
pkgdesc="A tool for managing bibliographic database"
depends=('python-bibtex' 'gconf' 'rarian' 'gnome-doc-utils' 'desktop-file-utils')
optdepends=('gnome-python: for the pybliographic program')
arch=('any')
license=('GPL')
install=pybliographer.install
url="http://www.pybliographer.org"
source=(http://downloads.sourceforge.net/project/pybliographer/Sources%20-%201.2/1.2.16/pybliographer-1.2.16.tar.xz configure.patch)
md5sums=('034b2d58dc75ca3f1389494e9f5ee9aa' 'ef198b2995d8c6842bbb839893fa798c')

package() {
  cd $srcdir/$pkgname-$pkgver

  patch -i $srcdir/configure.patch

  ./configure --prefix=/usr --disable-depchecks || return 1
  make	|| return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=$pkgdir install || return 1
  
  # This soft is insisting on mime pfff
  rm -f $pkgdir/usr/share/applications/mimeinfo.cache || return 1
}
