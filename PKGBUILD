# mkp224o
# Maintainer: Michael Saunders <michael (dot) saunders [at] tuta {dot} io>

pkgname=mkp224o
pkgver=1.7.0
pkgrel=1
pkgdesc="Vanity address generator for Tor onion v3 (ed25519) Onion Services"
arch=('i686' 'x86_64')
url="https://github.com/cathugger/mkp224o"
license=('custom:CC0')
provides=('mkp224o')
depends=('libsodium')

source=("https://github.com/cathugger/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-src.tar.zst"
        "https://github.com/cathugger/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-src.tar.zst.sig")

sha256sums=('a00f453dd43631bebdc2bcf1b2988fe5bc492ee3c96a403d2d90224e6b887c2e'
            'bca4f0df87f1be6a26fb7641a1f30f60bbc2c2798948c4a450fa0ff133a13295')

validpgpkeys=('5ADE4BE94F65E3C9BCBDD7D89BADDA2DAF6F01A8') # cathugger

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
