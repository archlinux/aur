# Maintainer: fenuks

pkgname=skim
pkgver=0.5.1
pkgrel=1
pkgdesc="Fuzzy Finder in rust!"
arch=('i686' 'x86_64')
depends=('ncurses')
makedepends=('rust' 'cargo')
url="https://github.com/lotabout/skim"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/lotabout/$pkgname/tar.gz/v$pkgver)
sha256sums=('f616e229971c75b14e46a5843389e61148262ad41965afa051ff85970f3a6773')
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
