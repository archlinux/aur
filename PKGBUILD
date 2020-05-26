# mkp224o
# Maintainer: Michael Saunders <michael (dot) saunders [at] tuta {dot} io>

pkgname=mkp224o
pkgver=1.5.0
pkgrel=1
pkgdesc="Vanity address generator for Tor onion v3 (ed25519) Onion Services"
arch=('i686' 'x86_64')
url="https://github.com/cathugger/mkp224o"
license=('custom:CC0')
provides=('mkp224o')
depends=('libsodium')

source=(https://github.com/cathugger/${pkgname}/archive/v${pkgver}.tar.gz)

sha256sums=('1bdc2b838ed53d62f62652e0b46d2632fad7ed703c65a00a96ad1b4547d74173')

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
