# Maintainer: Ali Molaei <ali dot molaei at protonmail com>
# Contributor: tirip01 <tirip01 at yahoo dot com>

_pkgname=icu
pkgname=${_pkgname}56
pkgver=56.2
pkgrel=1
pkgdesc="International Components for Unicode library"
arch=('i686' 'x86_64')
url="http://www.icu-project.org/"
license=('custom:"icu"')
depends=('gcc-libs>=4.7.1-5')
source=(https://github.com/unicode-org/icu/releases/download/release-56-2/icu4c-56_2-src.tgz)
sha256sums=('187faf495133f4cffa22d626896e7288f43d342e6af5eb8b214a1bf37bad51a6')

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

