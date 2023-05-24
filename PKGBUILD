#Maintainer: Musikolo<musikolo {at} hotmail [dot] com>
pkgname=pact-cli-bin
pkgver=2.0.1
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
sha1sums_aarch64=('a209d7c452974b1c74a0135f6657338aee9bb364'
                  'a6a984c19b6b9d07d7f90cffa6c64572e24a7a56')
sha1sums_x86_64=('d04e74baae795fc0a6b59fa64f6282933a1d6211'
                 '4a9be2da8ef2d4cdab5d1cf86d9ae64101c4fb40')

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
