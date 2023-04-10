# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: bitwave < aur aTt oomlu d0t de>
# Contributor: Peter Hoeg <first name at last name dot com>
pkgname=jdupes
pkgver=1.22.0
pkgrel=1
pkgdesc='A program for identifying duplicate files residing within specified directories'
arch=(i686 x86_64)
url=https://github.com/jbruchon/jdupes
license=(MIT)
depends=(glibc libjodycode)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('945b69f1570d058b70c40d144c5dfa9d5769f43e9488e8ac4f47bbb9ac973df7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make ENABLE_BTRFS=1 ENABLE_DEDUPE=1 STATIC_DEDUPE_H=1
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
