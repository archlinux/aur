# Contributor: Frank Ickstadt (frank dot ickstadt at gmail dot com)
# adpoted from Caved since pkgver=0.4.0-pre1

pkgname=photoprint
arch=(i686 x86_64)
pkgver=0.4.2rc2
pkgrel=7
license=('GPL')
pkgdesc="PhotoPrint is a utility designed to assist in the process of printing digital photographs under Linux and other UNIX-like operating systems."
url="http://www.blackfiveimaging.co.uk/index.php?article=02Software%2F01PhotoPrint"
depends=('gtk2' 'gutenprint' 'lcms' 'netpbm' 'libjpeg' 'libtiff' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('gutenprint' 'cups')
backup=()
install=${pkgname}.install
source=(http://www.blackfiveimaging.co.uk/photoprint/photoprint-0.4.2-pre2.tar.gz)
md5sums=('fbd33857d37081846df43cb52a9db3a8')

build() {
 cd ${srcdir}/photoprint-0.4.2-pre2
 for file in $(find -name '*.c' -or -name '*.cpp' -or -name '*.h'); do sed -i 's|#include <glib/[^>]*>|#include <glib.h>|' $file ; done
 ./configure --prefix=/usr
 make CFLAGS="$CFLAGS -lX11" || return 1
}

package() {
 cd ${srcdir}/photoprint-0.4.2-pre2
 make DESTDIR=${pkgdir} install
}
