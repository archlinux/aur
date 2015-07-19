# $Id$
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Dan McGee <dan@archlinux.org>

pkgname=irssi-naughty-bugs
pkgver=0.8.17
pkgrel=2
pkgdesc="irssi with some unaccepted patches"
arch=('i686' 'x86_64')
url="http://irssi.org/"
license=('GPL')
depends=('glib2' 'openssl')
optdepends=('perl-libwww: for the scriptassist script')
backup=('etc/irssi.conf')
source=("http://irssi.org/files/irssi-${pkgver}.tar.bz2"
	hostname-expandos.patch)
provides=('irssi')
conflicts=('irssi')
md5sums=('ecf64be47978d89a742b435a81cb47db'
	 '3538336c7317f3f52b076543ff2c798d')

build() {
  cd "${srcdir}/irssi-${pkgver}"

  # See irssi bug 829
  patch -p0 < "${srcdir}/hostname-expandos.patch"

  ./configure --prefix=/usr \
              --enable-ipv6 \
	      --with-proxy \
	      --sysconfdir=/etc \
	      --with-perl-lib=vendor
  make
}
package() {
  cd "${srcdir}/irssi-${pkgver}"

  make DESTDIR="${pkgdir}" install 
}
