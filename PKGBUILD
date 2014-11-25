# Maintainer: Olivier Mehani <shtrom-aur@ssji.net>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=iperf-dccp-tcpcc-cbr
pkgver=2.0.2
_srcpkgname=iperf-${pkgver}_DCCP-patched-CBR-continuous
pkgrel=3
pkgdesc="A tool to measure maximum TCP bandwidth, with support for DCCP, TCP pluggable congestion control and continuous runs"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.erg.abdn.ac.uk/users/gerrit/dccp/apps/#iperf"
depends=(gcc-libs)
source=(http://www.erg.abdn.ac.uk/users/gerrit/dccp/apps/iperf/zip/${_srcpkgname}.tar.bz2
	license
	http://www.erg.abdn.ac.uk/users/gerrit/dccp/apps/iperf/doc/README)
md5sums=('fd3627f47bd1667d9fd095799b649224'
	 'a2879f900b76668b28a1cc922909db18'
	 '8952b2cbcdbcecc9a8972255c1f1a210')

build() {
  cd ${srcdir}/${_srcpkgname}
  ./configure --prefix=/usr --program-suffix=-dccp
  make || return 1
  make DESTDIR=${pkgdir}/ install
  install -Dm644 ${srcdir}/license ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
  install -Dm644 ${srcdir}/README ${pkgdir}/usr/share/doc/${pkgname}/README-dccp-tcpcc-cbr-udplite
}
