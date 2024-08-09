#Maintainer: Musikolo<musikolo {at} hotmail [dot] com>
pkgname=pact-cli-bin
pkgver=2.4.10
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
sha1sums_aarch64=('34fb47c9b569773a7a04d10839d5228bed35b161'
                  '4b69109a5868d3417ff04266c8a7087bfe24a2b2')
sha1sums_x86_64=('ba65cba9607f8c636ea6abff65539ac5766ad48d'
                 'e3a6360f93fbf7a3a161d7d3a1cbbf58d582bc20')

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
