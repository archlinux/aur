# mkp224o
# Maintainer: Michael Saunders <michael (dot) saunders [at] tuta {dot} io>

pkgname=mkp224o
pkgver=1.4.0
pkgrel=1
pkgdesc="Vanity address generator for Tor onion v3 (ed25519) Onion Services"
arch=('i686' 'x86_64')
url="https://github.com/cathugger/mkp224o"
license=('CC0')
provides=('mkp224o')
depends=('libsodium')

source=(https://github.com/cathugger/${pkgname}/archive/v${pkgver}.tar.gz)

sha256sums=('36480893aca298b7a6b7d6f07dad27754a02211c5e64fa292c7d57153cf7db7c')

prepare() {
  cd "${pkgname}-${pkgver}"
  ./autogen.sh
}

build() {
  cd "${pkgname}-${pkgver}"

  # See README.txt for more information
  # Run `./configure --help` to see all available options
  # The following should allow for faster key generation
  _OPT="--enable-donna"
  
  ./configure "$_OPT"
  make
}

package() {
  install -m 755 -D "${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -m 644 -D "${pkgname}-${pkgver}/COPYING.txt" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
