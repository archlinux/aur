#Maintainer: Musikolo<musikolo {at} hotmail [dot] com>
pkgname=pact-cli-bin
pkgver=2.5.6
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
sha1sums_aarch64=('c26c5f5cfed5dff1be5ce01a6dd40ceedd03c10b'
                  'a536bad007b139bb12d45f583122fe137bac7674')
sha1sums_x86_64=('04789f03d857ef5520b8e3d3a3ee03d3f101fbe0'
                 'e332d505a052b64a27806decfba976707498565a')

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
