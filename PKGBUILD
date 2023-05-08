# Maintainer:Bipin Kumar <kbipinkumar@pm.me>

pkgname=aevol
pkgver=5.0
pkgrel=1
pkgdesc="an open-source digital genetics platform that captures the evolutionary process"
arch=('x86_64')
url="https://www.aevol.fr/"
license=('GPL3')
depends=('boost' 'glibc' 'gcc-libs' 'zlib' 'libx11')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.inria.fr/aevol/aevol/-/archive/v5.0/aevol-v${pkgver}.tar.gz"
        'automake.patch')
b2sums=('fd056e9bfe272236ba3912584d5428fb2f08e34f89e57476297720c595910d24db4656d8bf0cecf1ba1aab58a3c9b1110eb35a7ff50c0c32e62c1f79873d799d'
        'fb3a6f3deec5645aa2f0ae5c3b99d85ffff9a95f22bc0ae11be459a5ac5908df6acd0afe5b5c7182b6995f2ca2bda62e9d55852c3200681ab9b2393641ce952d')

prepare(){
  cp automake.patch "$pkgname-v$pkgver"/
  cd "$pkgname-v$pkgver"
  patch -p1 < automake.patch
  autoreconf -i  
  automake
}

build() {
  cd "$pkgname-v$pkgver"
  ./configure --prefix=/usr
  make
  
}

package() {
  cd "$pkgname-v$pkgver"
  make DESTDIR="${pkgdir}"/ install

}
