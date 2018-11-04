# Maintainer: fenuks

pkgname=skim
pkgver=0.5.2
pkgrel=1
pkgdesc="Fuzzy Finder in rust!"
arch=('i686' 'x86_64')
depends=('ncurses')
makedepends=('rust' 'cargo')
url="https://github.com/lotabout/skim"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/lotabout/$pkgname/tar.gz/v$pkgver)
sha256sums=('41280bee2138afefff95f76a640b753d1cb9215e8391ef37eab7ccb3517d9019')
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
