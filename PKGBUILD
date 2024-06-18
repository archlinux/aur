#Maintainer: Musikolo<musikolo {at} hotmail [dot] com>
pkgname=pact-cli-bin
pkgver=2.4.6
pkgdesc="A standalone client for the Pact Broker and Pactflow."
pkgrel=1
arch=(aarch64 x86_64)
url="https://github.com/pact-foundation/pact-ruby-standalone"
license=(MIT)
makedepends=()
depends=(libxcrypt-compat)
options=()
source_aarch64=("https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v${pkgver}/pact-${pkgver}-linux-arm64.tar.gz"
        "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v${pkgver}/pact-${pkgver}-linux-arm64.tar.gz.checksum")
source_x86_64=("https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v${pkgver}/pact-${pkgver}-linux-x86_64.tar.gz"
        "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v${pkgver}/pact-${pkgver}-linux-x86_64.tar.gz.checksum")
sha1sums_aarch64=('4efe6ab993399c1f416211f9b1390ba00fcd23ba'
                  'c6e95fc5d3b1bdefd1cee0bc02b83a53e3b8439c')
sha1sums_x86_64=('0a8f0a0db7e5682ffb1b1b7d2f7e6fd2aea19557'
                 'd7c8e00f678ed330fb9004ad08a83e549815c9ab')

prepare_aarch64() {
   msg2 "Verifying integrity..."
   cksum -c -a sha1 pact-${pkgver}-linux-arm64.tar.gz.checksum
}

prepare_x86_64() {
   msg2 "Verifying integrity..."
   cksum -c -a sha1 pact-${pkgver}-linux-x86_64.tar.gz.checksum
}

package() {
  mkdir -p "${pkgdir}/opt"
  mv "${srcdir}/pact" "${pkgdir}/opt/${pkgname}"

  mkdir -p "${pkgdir}/usr/bin/"
  cd "${pkgdir}/usr/bin/"
  for f in ${pkgdir}/opt/${pkgname}/bin/*;
  do
    name="$(basename "$f")"
    ln -s "/opt/${pkgname}/bin/$name" "$name"
  done
}
