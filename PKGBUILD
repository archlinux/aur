# Maintainer: lilydjwg <lilydjwg@gmail.com>
pkgname=ssed
pkgver=3.62
pkgrel=3
pkgdesc="Super-sed is a heavily enhanced version of sed that supports PCRE."
arch=(i686 x86_64)
url="https://github.com/aureliojargas/sed.sf.net/tree/master/grabbag/ssed"
license=("GPLv2")
makedepends=(gcc sed bison)
source=(https://github.com/aureliojargas/sed.sf.net/raw/refs/heads/master/grabbag/ssed/sed-${pkgver}.tar.gz)
md5sums=('8f35882af95da4e5ddbf3de1add26f79')

build() {
  cd $srcdir/sed-${pkgver}
  ./configure --prefix=/usr --program-prefix=s --mandir='${prefix}'/share/man
  make
}
package() {
  cd $srcdir/sed-${pkgver}
  # sed -i "s.^prefix = /usr\$.prefix = ${pkgdir}/usr." Makefile
  make prefix=${pkgdir}/usr install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  mv ${pkgdir}/usr/info ${pkgdir}/usr/share/info
  mv ${pkgdir}/usr/share/info/sed.info ${pkgdir}/usr/share/info/ssed.info
}
