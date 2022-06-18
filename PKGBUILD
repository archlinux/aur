# mkp224o
# Maintainer: Michael Saunders <michael (dot) saunders [at] tuta {dot} io>

pkgname=mkp224o
pkgver=1.6.0
pkgrel=1
pkgdesc="Vanity address generator for Tor onion v3 (ed25519) Onion Services"
arch=('i686' 'x86_64')
url="https://github.com/cathugger/mkp224o"
license=('custom:CC0')
provides=('mkp224o')
makedepends=('libsodium')

source=("https://github.com/cathugger/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-src.tar.zst")
# The following .sig and checksum have been verified locally against the author
# key provided here: https://github.com/cathugger/mkp224o/issues/78#issuecomment-1142068306
# It is not currently included as it is not present on any keyserver and would
# make the package a little troublesome for some to install.
# "https://github.com/cathugger/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-src.tar.zst.sig"
# 'bf0357d42bc17e605947d09e808bbf935d6d33ad8ba3157180af4fbc9371b3bb'

sha256sums=('43a443a35f1a2d19dbd17d9b617b70bb1179e5d42f3cee6f55fcacf8829610ce')

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
