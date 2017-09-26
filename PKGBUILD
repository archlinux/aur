# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Art Gramlich <art@gramlich-net.com>
# Contributor: twa022 <twa022 at gmail dot com>
# Maintainer: Jameson Pugh <imntreal@gmail.com>

_pkgname=icu
pkgname=${_pkgname}55
pkgver=55.1
pkgrel=2
pkgdesc="International Components for Unicode library"
arch=('i686' 'x86_64')
url="http://www.icu-project.org/"
license=('custom:"icu"')
depends=('gcc-libs>=4.7.1-5' 'sh')
makedepends=('clang')
source=(https://svwh.dl.sourceforge.net/project/icu/ICU4C/55.1/icu4c-55_1-src.tgz)
sha256sums=('e16b22cbefdd354bec114541f7849a12f8fc2015320ca5282ee4fd787571457b')

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
