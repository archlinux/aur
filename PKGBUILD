# Maintainer: fenuks

pkgname=skim
pkgver=0.4.0
pkgrel=1
pkgdesc="Fuzzy Finder in rust!"
arch=('i686' 'x86_64')
depends=('ncurses')
makedepends=('rust' 'cargo')
url="https://github.com/lotabout/skim"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/lotabout/$pkgname/tar.gz/v$pkgver)
sha256sums=('0ef146fbec74a6baa9cedb4035baf4d4e592538f02bcf600119ef63fea12e3cf')
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
