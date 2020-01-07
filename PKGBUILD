# Maintainer: bitwave < aur aTt oomlu d0t de>
# Contributor: Peter Hoeg <first name at last name dot com>
pkgname=jdupes
pkgver=1.14.0
pkgrel=1
pkgdesc="Is a program for identifying duplicate files residing within specified directories"
arch=('i686' 'x86_64')
url="https://github.com/jbruchon/jdupes"
license=('MIT')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b83285d97f1df5602647749829fdcdbcf21ece273c669bdb8e62544238b1f54e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make ENABLE_BTRFS=1 ENABLE_DEDUPE=1 STATIC_DEDUPE_H=1
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

# vim: set ts=2 sw=2 et:
