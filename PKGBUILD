# Maintainer: fenuks

pkgname=skim
pkgver=0.2.0
pkgrel=1
pkgdesc="Fuzzy Finder in rust!"
arch=('i686' 'x86_64')
depends=('ncurses')
makedepends=('rust' 'cargo')
url="https://github.com/ocaml/merlin"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/lotabout/$pkgname/tar.gz/v$pkgver)
sha256sums=('57e0a16c1be30652c2cdddb6da7dd3d676094952ddf52db48c711024d4fcf0eb')
provides=('skim')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 755 bin/sk-tmux -t "${pkgdir}/usr/bin/"
  install -Dm 644 plugin/skim.vim -t "${pkgdir}/usr/share/vim/vimfiles/plugin/"
  cargo install --root "${pkgdir}/usr"
  rm -f "${pkgdir}/usr/.crates.toml"
}
