# Maintainer: Andrew Fischer <andrew at apastron dot co>
pkgname=multichain-alpha
pkgver=2.0
pkgrel=1
pkgdesc="MultiChain open source platform for private blockchains - version 2 alpha"
arch=('x86_64')
url="https://github.com/MultiChain/multichain"
license=('GPLv3')
depends=('db4.8' 'boost' 'openssl')
provides=('multichain-alpha')
source=("https://github.com/MultiChain/multichain/archive/${pkgver}-release.tar.gz", "multichain-boost-openssl.patch")
md5sums=('766ac031265c6ae7c35c14400ea58c78', 'f3030d087c08bc5b60083faad3284012')  

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}-release"
  # Multichain uses an out of date boost and openssl, patch to fix
  patch -p1 < ${srcdir}/multichain-boost-openssl.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-release"
  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-release"
  make DESTDIR="${pkgdir}" install
}
