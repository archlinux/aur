# Maintainer: Davi da Silva Böger <dsboger@gmail.com>

_pkgname=nas
pkgname=lib32-$_pkgname
pkgver=1.9.4
pkgrel=2
pkgdesc='Network Audio System is a network transparent, client/server audio transport system (multilib)'
arch=('i686' 'x86_64')
url='http://radscan.com/nas.html'
license=('MIT')
depends=('nas' 'lib32-libxt')
makedepends=('imake' 'bison' 'flex' 'lib32-flex' 'lib32-libxaw')
provides=('lib32-libaudio2')
conflicts=('lib32-libaudio2')
source=("http://downloads.sourceforge.net/sourceforge/${_pkgname}/${_pkgname}-${pkgver}.src.tar.gz")
md5sums=('dac0e6cd3e5d6a37ae1dff364236a752')

build() {
  cd ${_pkgname}-${pkgver}
  xmkmf
  make World CC='gcc -m32'
}

package() {
  cd ${_pkgname}-${pkgver}

  make install CC='gcc -m32' DESTDIR=${pkgdir} USRLIBDIR=/usr/lib32 LDLIBS='-lfl'
  # Remove files conflicting with x86_64 nas
  rm -rf "${pkgdir}"/{etc,usr/{bin,include,lib}}
}
