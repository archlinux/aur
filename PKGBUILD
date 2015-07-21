# Maintainer : Pedro Martinez-Julia <pedromj@um.es>

pkgname=hipl
pkgver=20130906
pkgrel=1
pkgdesc="Implementation of the Host Identity Protocol (HIP) for Linux."
arch=('i686' 'x86_64')
url="http://infrahip.hiit.fi"
license=('MIT' 'GPL')
makedepends=('automake' 'libtool')
depends=('libnetfilter_queue' 'python2' 'perl-net-dns')
source=(http://hipl.hiit.fi/hipl/${pkgname}.tar.gz)
sha256sums=('e9779f00d1466355777b48050123487d01d3b19475a9a030535ee097ed8988fb')

build() {
  cd "$srcdir"/hipl-1.0.8
  for file in tools/hipdnskeyparse/hipdnskeyparse.in tools/hipdnsproxy/hipdnsproxy.in tools/hipdnsproxy/DNS/Serialization.py tools/hipdnskeyparse/myasn.py tools/hipdnsproxy/dnsproxy.py tools/hipdnsproxy/hosts.py tools/hipdnsproxy/resolvconf.py tools/hipdnsproxy/resolvconf_test.py tools/hipdnsproxy/util.py; do
	  sed -i "s/env python$/env python2/g" $file
  done
  PYTHON=python2 ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin
  make
}

package() {
  cd ${srcdir}/hipl-1.0.8
  make DESTDIR="${pkgdir}" install
  install -m644 -D COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
