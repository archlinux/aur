# Maintainer: Guoyi Zhang <myname at malacology dot net>
pkgname=soapnuke
pkgver=2.1.8
_pkgname=SOAPnuke
pkgrel=1
pkgdesc="A Tool for integrated Quality Control and Preprocessing on FASTQ or BAM/CRAM files \
	 http://dx.doi.org/10.5524/100361"
url="https://github.com/BGI-flexlab/SOAPnuke"
license=('GPL3')
arch=('x86_64')
depends=('gcc-libs' 'zlib' 'glibc')
makedepends=('make' 'bc')
source=("${url}/archive/refs/tags/${_pkgname}${pkgver}.tar.gz"
	"https://github.com/BGI-flexlab/SOAPnuke/pull/64.patch")
sha512sums=('437b5b5f17a62fc308c99ebb4a8ab312cb8f4b5850b8091c203f86b262ef3ba106e5d608cd6e2b70bb6ecf58cc2f8e0605d69efa118497c36c9f561c76921dff'
            'a5b6b3518dc381714745c385c7822a68a6772df59ff783f21192a6f3eb6ef81c46a5eda4b3d8d96a31d20733be0f5ca035bfe262b202342ce94b4e6dd78e0abe')
prepare() {
  cd "${srcdir}/${_pkgname}-$_pkgname$pkgver"
  patch -p1 < $srcdir/64.patch
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
