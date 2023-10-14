#Maintainer: Musikolo<musikolo {at} hotmail [dot] com>
pkgname=pact-cli-bin
pkgver=2.0.9
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
sha1sums_aarch64=('efde6a09e6985983a4f0ba7399dd9a28248198c3'
                  'df12d34cc7300d7a5d1a77b8dd1c76dc1c4176da')
sha1sums_x86_64=('6eda14c797dc118b29047371e6f400c7e586c08e'
                 'c71d8dcf9614da45d3e5f0f2dcbe40aebf83120d')

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
