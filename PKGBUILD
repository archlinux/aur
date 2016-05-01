# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Art Gramlich <art@gramlich-net.com>
# Contributor: twa022 <twa022 at gmail dot com>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Maintainer: Dylan Ferris <dylan@psilly.com>
# Based on icu55 package, version 53 required by UE4Editor

_pkgname=icu
pkgname=${_pkgname}53
pkgver=53.1
pkgrel=1
pkgdesc="International Components for Unicode library"
arch=('i686' 'x86_64')
url="http://www.icu-project.org/"
license=('custom:"icu"')
depends=('gcc-libs>=4.7.1-5' 'sh')
source=(http://download.icu-project.org/files/${_pkgname}4c/${pkgver}/${_pkgname}4c-${pkgver//./_}-src.tgz)
sha256sums=('6fa74fb5aac070c23eaba1711a7178fe582c59867484c5ec07c49002787a9a28')

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
