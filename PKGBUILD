# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Art Gramlich <art@gramlich-net.com>
# Contributor: twa022 <twa022 at gmail dot com>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Maintainer: Ryan Gonzalez <rymg19@gmail.com>

_pkgname=icu
pkgname=${_pkgname}55-staticlibs
pkgver=55.1
pkgrel=1
pkgdesc="International Components for Unicode library (static libraries only)"
arch=('i686' 'x86_64')
url="http://www.icu-project.org/"
license=('custom:"icu"')
depends=('gcc-libs>=4.7.1-5' 'sh')
makedepends=('clang')
source=(http://downloads.sourceforge.net/project/icu/ICU4C/55.1/icu4c-55_1-src.tgz)
sha256sums=('e16b22cbefdd354bec114541f7849a12f8fc2015320ca5282ee4fd787571457b')

build() {
  cd ${srcdir}/${_pkgname}/source
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--mandir=/usr/share/man \
    --enable-static
  make
}

package() {
  cd ${srcdir}/${_pkgname}/source
  make -j1 DESTDIR=${pkgdir} install
  rm -r "${pkgdir}"/usr/{bin,include,sbin,share,lib/*so*,lib/icu}
  rm -r "${pkgdir}/usr/lib/pkgconfig"

  # Install license
  install -Dm644 ${srcdir}/${_pkgname}/license.html ${pkgdir}/usr/share/licenses/${pkgname}/license.html
}
