# Maintainer:  KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>

pkgname=nushell
pkgver=0.21.0
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
sha256sums=('24598bcf6e61825fd3b6f17e083952926a4b072efff413748bbd5bc83a3158f1')
b2sums=('b09cf833353b302479238f938a92979a6d37cb4072a945a5abbf637757c5083ccc59906ba7527bfcad5e6bf89eb9eecafc94a263597934720950833e4516bffd')

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
