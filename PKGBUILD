# Maintainer: Jesse Jaaara <jesse.jaara@gmail.com>

pkgbase=voikko-fi
pkgname=(voikko-fi voikko-fi-malaga)
pkgver=2.0
pkgrel=1
arch=('any')
url="http://voikko.puimula.org/"
pkgdesc="Finnish dictionary for libvoikko based spell checkers."
license=('GPL2')
depends=()
makedepends=('libvoikko>=4.0' 'python' 'foma')
source=(http://www.puimula.org/voikko-sources/voikko-fi/voikko-fi-${pkgver}.tar.gz
        http://www.puimula.org/voikko-sources/voikko-fi/voikko-fi-${pkgver}.tar.gz.asc)
md5sums=('8a399ff8d56a0d62c52f93a7f4ec8507'
         'SKIP')

build() {
  cd "${srcdir}/voikko-fi-${pkgver}"

  make vvfst voikko
}

package_voikko-fi() {
  pkgdesc="Finnish dictionary for libvoikko based spell checkers. (vvfst format)"
  
  cd "${srcdir}/voikko-fi-${pkgver}"

  make DESTDIR="${pkgdir}/usr/share/voikko/" vvfst-install
}


package_voikko-fi-malaga() {
  pkgdesc="Finnish dictionary for libvoikko based spell checkers. (old malaga format)"
  provides=('suomi-malaga-voikko')
  conflicts=('suomi-malaga-voikko')

  cd "${srcdir}/voikko-fi-${pkgver}"

  make DESTDIR="${pkgdir}/usr/share/voikko" voikko-install
}

# vim:set ts=2 sw=2 et:
