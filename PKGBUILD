# $Id: PKGBUILD 55456 2011-09-13 00:28:38Z ebelanger $
# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>

pkgname=driftnet-debian
pkgver=0.1.6
_pkgdebpatchver=9
pkgrel=1
pkgdesc="Listens to network traffic and picks out images from TCP streams it observes. (with Debian patches)"
arch=('i686' 'x86_64')
url=('http://www.ex-parrot.com/~chris/driftnet/')
license=('GPL')
provides=('driftnet')
conflicts=('driftnet')
depends=('libpcap' 'gtk2' 'giflib')
makedepends=('imake')
source=("http://www.ex-parrot.com/~chris/driftnet/driftnet-${pkgver}.tar.gz"
        "http://ftp.de.debian.org/debian/pool/main/d/driftnet/driftnet_${pkgver}-${_pkgdebpatchver}.diff.gz")
md5sums=('8e11d77770452f97bb3c23f510489815'
         '912c7ff5c0af1ebf4482749aa53533e6')

build() {
  cd "${srcdir}/driftnet-${pkgver}"
  patch -p1 -i "${srcdir}/driftnet_${pkgver}-${_pkgdebpatchver}.diff"
  sed -i -e 's/$(OBJS) $(LDFLAGS)/$(LDFLAGS) $(OBJS)/' Makefile
  make
}

package() {
  cd "${srcdir}/driftnet-${pkgver}"
  install -D -m755 driftnet "${pkgdir}/usr/bin/driftnet"
  install -D -m644 driftnet.1 "${pkgdir}/usr/share/man/man1/driftnet.1"
}
