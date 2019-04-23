# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Art Gramlich <art@gramlich-net.com>

_pkgname=icu
pkgname=${_pkgname}63
pkgver=63.2
pkgrel=1
pkgdesc="International Components for Unicode library"
arch=('i686' 'x86_64')
url="http://www.icu-project.org/"
license=('custom:icu')
depends=('gcc-libs' 'sh')
makedepends=('clang' 'make' 'patch')
source=(https://github.com/unicode-org/icu/releases/download/release-63-2/icu4c-63_2-src.tgz)
sha512sums=('5fa9092efd8d6da6dfc8d498e4026167fda43423eaafc754d1789cf8fd4f6e76377878ebcaa32e14f314836136b764873511a93bfbcc5419b758841cc6df8f32')

build() {
  cd ${srcdir}/${_pkgname}/source
  
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--mandir=/usr/share/man \
	--sbindir=/usr/bin
  make
}

package() {
  cd ${srcdir}/${_pkgname}/source
  
  make -j1 DESTDIR=${pkgdir} install
  rm -r "${pkgdir}"/usr/{bin,include,share,lib/*so,lib/icu/{Makefile.inc,current,pkgdata.inc}}
  rm -r "${pkgdir}/usr/lib/pkgconfig"

  # Install license
  install -Dm644 ${srcdir}/${_pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

