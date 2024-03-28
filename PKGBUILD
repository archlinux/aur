# Maintainer: Guoyi Zhang <myname at malacology dot net>
pkgname=soapnuke
pkgver=2.1.9
_pkgname=SOAPnuke
pkgrel=1
pkgdesc="A Tool for integrated Quality Control and Preprocessing on FASTQ or BAM/CRAM files \
	 http://dx.doi.org/10.5524/100361"
url="https://github.com/BGI-flexlab/SOAPnuke"
license=('GPL-3.0-only')
arch=('x86_64')
depends=('gcc-libs' 'zlib' 'glibc')
makedepends=('make' 'bc')
source=("${url}/archive/refs/tags/${_pkgname}${pkgver}.tar.gz"
	"${pkgname}_2.1.9.patch::https://github.com/BGI-flexlab/SOAPnuke/pull/68.patch")
sha512sums=('ed717ea5a7635be00dbc66dc10c5a6ad251cca2e881146e2dae19b954f9e2678c9a8ea41a890e50b2385289497c667bc227ef0271b1b98073c405195370abc8b'
            '41e15f5b5d559e5cfa6340a81222c2c7b3dfbcfb4c30aca58dd22f8dfbb05fb99026cda4fdc4c8c3ed2ebb7f9c891c5bb4309c210e7676214f6f6f72455ec9bb')

prepare(){
  cd "${srcdir}/${_pkgname}-$_pkgname$pkgver"
  patch -p1 < $srcdir/${pkgname}_2.1.9.patch
}


build() {
  cd "${srcdir}/${_pkgname}-$_pkgname$pkgver"
  make
}

package() {
  cd "${srcdir}/${_pkgname}-$_pkgname$pkgver"
  install -Dm755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
