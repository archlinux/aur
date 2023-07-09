# Maintainer: Guoyi Zhang <myname at malacology dot net>
pkgname=soapnuke
pkgver=2.1.7
_pkgname=SOAPnuke
pkgrel=4
pkgdesc="A Tool for integrated Quality Control and Preprocessing on FASTQ or BAM/CRAM files \
	 http://dx.doi.org/10.5524/100361"
url="https://github.com/BGI-flexlab/SOAPnuke"
license=('GPL3')
arch=('x86_64')
depends=('gcc-libs' 'zlib')
makedepends=('make')
source=("${url}/archive/refs/tags/${_pkgname}${pkgver}.tar.gz"
	"https://github.com/BGI-flexlab/SOAPnuke/pull/63.patch")
sha512sums=('7c0df7ed88161b0dd1e601ff2a157375ded5c524bef6c6e37195099a0928b5a1b8d962504e798aa0604706acbbb912e97ac6faee5abd497d42081f66c787f962'
            '0d040a5d7d470326ada585086ac677808976578a1323e5792c522773196bc48791137eb976b71005da05931459636815d3cb2ddadaef79021b2bfc8084f8d06b')
prepare() {
  cd "${srcdir}/${_pkgname}-$_pkgname$pkgver"
  patch -p1 < $srcdir/63.patch
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
