# Maintainer:  KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>

pkgname=nushell
pkgver=0.22.0
pkgrel=1
pkgdesc="A new type of shell."
url="https://www.nushell.sh"
license=('MIT')
depends=('openssl' 'libxcb' 'libgit2' 'zlib')
optdepends=('libx11: for binaryview plugin')
makedepends=('rust')
arch=('x86_64' 'i686')
source=("https://github.com/nushell/nushell/archive/${pkgver}.tar.gz")
install=nushell.install
sha256sums=('a7ee864b711d43bec1d611aa11ac70ff62f254d09ee507bbbe7aa3ceaf7b4f39')
b2sums=('e5a0af0aa5718a4cf47a56aa26eef11b27638923a7aa7c48629c8fc13a139bb2dfb18ece4872aae5135583b93d24d0f07b76c6348cf63ae601e99c004195ead9')

build() {
  cd "${pkgname}-${pkgver}"

  cargo build --release --locked --features extra
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm0755 -t "${pkgdir}/usr/bin" \
    target/release/nu $(find target/release -maxdepth 1 -type f -executable -name 'nu_plugin_*')

  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
