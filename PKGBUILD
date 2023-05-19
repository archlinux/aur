#Maintainer: Musikolo<musikolo {at} hotmail [dot] com>
pkgname=pact-cli-bin
pkgver=2.0.1
pkgdesc="A standalone client for the Pact Broker and Pactflow."
pkgrel=1
arch=(x86_64)
url="https://github.com/pact-foundation/pact-ruby-standalone"
license=(MIT)
makedepends=()
depends=(libxcrypt-compat)
options=()
source=("https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v${pkgver}/pact-${pkgver}-linux-${arch}.tar.gz"
        "https://github.com/pact-foundation/pact-ruby-standalone/releases/download/v${pkgver}/pact-${pkgver}-linux-${arch}.tar.gz.checksum")
sha1sums=('d04e74baae795fc0a6b59fa64f6282933a1d6211'
          '4a9be2da8ef2d4cdab5d1cf86d9ae64101c4fb40')

prepare() {
   msg2 "Verifying integrity..."
   cksum -c -a sha1 pact-${pkgver}-linux-${arch}.tar.gz.checksum
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
