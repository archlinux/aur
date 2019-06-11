# Author: marmotz <rlittolff@gmail.com>

_pkgname=icu
pkgname=${_pkgname}62
pkgver=62.2
pkgrel=0
pkgdesc="International Components for Unicode library"
arch=('i686' 'x86_64')
url="http://www.icu-project.org/"
license=('custom:"icu"')
depends=('gcc-libs>=4.7.1-5')
source=(https://github.com/unicode-org/${_pkgname}/releases/download/release-${pkgver//./-}/${_pkgname}4c-${pkgver//./_}-src.tgz)
md5sums=('b26c157dee099d89bfdf6d31c0ccbd30')

build() {
  cd ${srcdir}/${_pkgname}/source
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --mandir=/usr/share/man
  make -j5
}

package() {
  cd ${srcdir}/${_pkgname}/source
  make -j5 DESTDIR=${pkgdir} install
  rm -r "${pkgdir}"/usr/{bin,include,sbin,share,lib/*so,lib/icu/{Makefile.inc,current,pkgdata.inc}}
  rm -r "${pkgdir}/usr/lib/pkgconfig"

  # Install license
  install -Dm644 ${srcdir}/${_pkgname}/license.html ${pkgdir}/usr/share/licenses/${pkgname}/license.html
}
