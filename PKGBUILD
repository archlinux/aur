# Maintainer: sumt <sci.fi: sumt>
# Contributor: Jesse Jaara      <gmail.com: jesse.jaara>
# Contributor: Janne Haapsaari  <iki.fi: haaja>

pkgname=hfstospell-git
pkgver=0.4.5.r0.gd791a41
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
source=('hfstospell-git::git+https://github.com/hfst/hfst-ospell.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package () {
   cd "$pkgname"
   make DESTDIR="${pkgdir}" install
}
