# Maintainer: Jesse Jaara	<gmail.com: jesse.jaara>
# Contributor: Janne Haapsaari	<iki.fi: haaja>

pkgname=hfstospell
pkgver=0.5.0
pkgrel=1
pkgdesc='Helsinki Finite-State Transducer Technology (HFST) tools'
arch=('i686' 'x86_64')
url='http://www.ling.helsinki.fi/kieliteknologia/tutkimus/hfst/'
license=('APACHE')
depends=('libxml++2.6' 'libarchive')
options=(!libtool)
source=(https://github.com/hfst/hfst-ospell/archive/v${pkgver}.tar.gz)
md5sums=('3bd03999cd4ec1365768c76713e0d0ef')

prepare() {
  cd "${srcdir}/hfst-ospell-${pkgver}"

  sed 's|UnicodeString|icu::UnicodeString|g' -i office.cc
  ./autogen.sh
}

build() {
  cd "${srcdir}/hfst-ospell-${pkgver}"

  ./configure --prefix=/usr

  make
}

package () {
  cd "${srcdir}/hfst-ospell-${pkgver}"

   make DESTDIR="${pkgdir}" install
}
