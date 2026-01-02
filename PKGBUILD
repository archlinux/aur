# Maintainer: Nihal Kumar <2tv8xupqg at mozmail dot com>
pkgname=relax-player
pkgver=1.1.0
pkgrel=1
pkgdesc="Ambient sound player (rain, thunder, campfire) with an alsamixer-style TUI"
arch=('x86_64')
url="https://github.com/ebithril/relax-player"
license=('MIT')
depends=('alsa-lib')
makedepends=('rust' 'cargo' 'pkgconf' 'openssl')
provides=()
conflicts=()
source=("https://github.com/ebithril/relax-player/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7d123fc2550a2806a96dc4790a56f334c94e5fb83a3b1acf89397b5562b9a40a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit 1

  cargo build --release --locked
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit 1

  install -Dm755 "target/release/relax-player" "${pkgdir}/usr/bin/relax-player"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
