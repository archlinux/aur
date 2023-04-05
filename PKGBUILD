#Maintainer: Musikolo<musikolo {at} hotmail [dot] com>
pkgname=pact-cli-bin
pkgver=1.92.0
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
sha1sums=('67e140ae291947dcd164a8facc7fe20bb1d99b19'
          '7c16b4d760141c3dcc5bacee54b40d75a7341353')

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
