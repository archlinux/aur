pkgname=ssmping
pkgver=0.9.1
pkgrel=3
pkgdesc="SSM ping"
arch=(i686 x86_64)
url="http://www.venaas.no/multicast/ssmping/"
license=('Custom')
source=('http://http.debian.net/debian/pool/main/s/ssmping/ssmping_0.9.1.orig.tar.gz' 'ssmping_x86_64.patch')
sha512sums=('7929b43867f29ac7f93298820149fd326d8540187a59e4f28f226e1c0dbfcdc60dc3da437de250e4082a2d6bd845ae9e619bf3b592b824dd8d529bf093cdedff'
            '9255dc2d9591f083c04040de821ae23da6a7c3b94b28aeeb6035eaf365dd562d6398a0c876afb569777571f42c6badbc18614dadc9bb11a4d73e18d1b00f818b')


build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  msg "Applying patches..."
  patch -p1 -i '../ssmping_x86_64.patch'

  msg "Starting make..."

  make CFLAGS=-D_GNU_SOURCE || return 1
}


package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" PREFIX=/usr install || return 1
  install -d "${pkgdir}"/usr/share
  mv "${pkgdir}/usr/man" "${pkgdir}/usr/share/man"
}
