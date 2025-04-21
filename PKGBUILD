# Maintainer: sumt <sci.fi: sumt>
# Contributor: Jesse Jaara      <gmail.com: jesse.jaara>
# Contributor: Janne Haapsaari  <iki.fi: haaja>

pkgname=hfstospell-git
pkgver=0.5.4.r0.g85edd77
pkgrel=1
pkgdesc='Helsinki Finite-State Transducer Technology (HFST) tools'
arch=('i686' 'x86_64')
url='https://hfst.github.io/'
license=('APACHE')
depends=('libxml++2.6' 'libarchive' 'icu')
makedepends=('git')
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
options=(!libtool)
source=('git+https://github.com/hfst/hfst-ospell.git')
md5sums=('SKIP')

pkgver() {
  cd "hfst-ospell"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "hfst-ospell"

  ./autogen.sh
  ./configure --prefix=/usr

  make
}

package () {
   cd "hfst-ospell"

   make DESTDIR="${pkgdir}" install
}
