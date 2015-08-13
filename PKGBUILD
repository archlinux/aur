pkgname=systemtap
pkgver=2.8
pkgrel=1
pkgdesc="SystemTap provides free software (GPL) infrastructure to simplify the gathering of information about the running Linux system."
url="http://sourceware.org/systemtap/"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('elfutils' 'nss' 'python2')
makedepends=('gcc')
optdepends=('sqlite3' 'linux-fedora')
source=(http://sourceware.org/systemtap/ftp/releases/$pkgname-$pkgver.tar.gz)
sha1sums=('95034e8243e1f9fd33b765afda06546083df1b7f')

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
