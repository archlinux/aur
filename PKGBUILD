pkgname=systemtap
pkgver=2.7
pkgrel=3
pkgdesc="SystemTap provides free software (GPL) infrastructure to simplify the gathering of information about the running Linux system."
url="http://sourceware.org/systemtap/"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('elfutils' 'nss' 'python2')
makedepends=('gcc')
optdepends=('sqlite3' 'linux-fedora')
source=(http://sourceware.org/systemtap/ftp/releases/$pkgname-$pkgver.tar.gz .AURINFO)
sha1sums=('5562d16446434e1a9a377697c45eb0852303ae41'
          'SKIP')

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
