# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Art Gramlich <art@gramlich-net.com>
# Contributor: twa022 <twa022 at gmail dot com>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Maintainer: Anselmo L. S. Melo <anselmolsm@gmail.com> 

_pkgname=icu
pkgname=${_pkgname}54
pkgver=54.1
pkgrel=1
pkgdesc="International Components for Unicode library"
arch=('i686' 'x86_64')
url="http://www.icu-project.org/"
license=('custom:"icu"')
depends=('gcc-libs>=4.7.1-5' 'sh')
source=(http://download.icu-project.org/files/${_pkgname}4c/${pkgver}/${_pkgname}4c-${pkgver//./_}-src.tgz)
sha256sums=('d42bc9a8ca6a91c55eb0925c279f49e5b508d51ef26ac9850d9be55de5bb8ab3')

build() {
  cd ${srcdir}/${_pkgname}/source
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--mandir=/usr/share/man
  make
}

package() {
  cd ${srcdir}/${_pkgname}/source
  make -j1 DESTDIR=${pkgdir} install
  rm -r "${pkgdir}"/usr/{bin,include,sbin,share,lib/*so,lib/icu/{Makefile.inc,current,pkgdata.inc}}
  rm -r "${pkgdir}/usr/lib/pkgconfig"

  # Install license
  install -Dm644 ${srcdir}/${_pkgname}/license.html ${pkgdir}/usr/share/licenses/${pkgname}/license.html
}

# vim:set ts=2 sw=2 et:
