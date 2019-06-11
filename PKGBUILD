# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Art Gramlich <art@gramlich-net.com>
# Contributor: twa022 <twa022 at gmail dot com>
# Maintainer: Jameson Pugh <imntreal@gmail.com>

_pkgname=icu
pkgname=${_pkgname}55
pkgver=55.2
pkgrel=1
pkgdesc="International Components for Unicode library"
arch=('i686' 'x86_64')
url="http://www.icu-project.org/"
license=('custom:"icu"')
depends=('gcc-libs' 'sh')
makedepends=('clang')
source=('https://github.com/unicode-org/icu/releases/download/release-55-2/icu4c-55_2-src.tgz')
sha256sums=('eda2aa9f9c787748a2e2d310590720ca8bcc6252adf6b4cfb03b65bef9d66759')

build() {
  cd "${srcdir}/${_pkgname}/source"
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--mandir=/usr/share/man
  make
}

check() {
  cd "${srcdir}/${_pkgname}/source"
  make check
}

package() {
  cd "${srcdir}/${_pkgname}/source"
  make DESTDIR="$pkgdir/" install
  rm -r "${pkgdir}"/usr/{bin,include,sbin,share,lib/*so,lib/icu/{Makefile.inc,current,pkgdata.inc}}
  rm -r "${pkgdir}/usr/lib/pkgconfig"

  # Install license
  install -Dm644 "${srcdir}/${_pkgname}/license.html" "${pkgdir}/usr/share/licenses/${pkgname}/license.html"
}
