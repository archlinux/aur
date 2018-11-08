# Maintainer: fenuks

pkgname=skim
pkgver=0.5.2
pkgrel=2
pkgdesc="Fuzzy Finder in rust!"
arch=('i686' 'x86_64')
depends=('ncurses')
makedepends=('rust')
url="https://github.com/lotabout/skim"
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/lotabout/${pkgname}/tar.gz/v${pkgver}")
sha256sums=('41280bee2138afefff95f76a640b753d1cb9215e8391ef37eab7ccb3517d9019')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo test --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 target/release/sk bin/sk-tmux -t "${pkgdir}/usr/bin/sk"
  install -Dm644 plugin/skim.vim -t "${pkgdir}/usr/share/vim/vimfiles/plugin/"
  install -dm755 "${pkgdir}/usr/share/skim"
  install -m644 shell/*.bash shell/*.zsh "${pkgdir}/usr/share/skim"
  install -Dm644 "shell/key-bindings.fish" "${pkgdir}/usr/share/fish/functions/skim_key_bindings.fish"
}
