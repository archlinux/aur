pkgname=systemtap
pkgver=3.1
pkgrel=1
pkgdesc="SystemTap provides free software (GPL) infrastructure to simplify the gathering of information about the running Linux system."
url="http://sourceware.org/systemtap/"
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
license=('GPL')
depends=('elfutils' 'nss' 'python2' 'texlive-fontsextra' 'texlive-latexextra' 'latex2html')
makedepends=('gcc')
optdepends=('sqlite3')
source=(http://sourceware.org/systemtap/ftp/releases/$pkgname-$pkgver.tar.gz)
sha1sums=('2927ee7e780b45e47d770798f80dfd5be62e095d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc || return 1
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  echo enable python2...
  sed -i 's/python/python2/g' ${pkgdir}/usr/bin/dtrace
}

# vim:set ts=2 sw=2 et:
