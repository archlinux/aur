# Maintainer: Miko (mikoxyz) <mikoxyzzz@gmail.com>
# Contributor: nerfingen <nerfingen@yahoo.de>

_pkgname=weechat-discord-mk3
pkgname=weechat-discord-mk3-git
pkgver=r626.a3dd82b
pkgrel=1
pkgdesc="Discord plugin for weechat (mk3)"
arch=('i686' 'x86_64')
url="https://github.com/terminal-discord/weechat-discord/tree/mk3"
license=('MIT')
depends=('weechat')
makedepends=('git' 'rust' 'clang')
conflicts=('weechat-discord-git')
options=('!lto')
source=("${_pkgname}::git+https://github.com/terminal-discord/weechat-discord.git#branch=mk3")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

check() {
  cd "${_pkgname}"
  RUSTUP_TOOLCHAIN=stable cargo test --release --locked --target-dir=target
 }

package() {
  cd "${_pkgname}"

  install -D "target/release/libweecord.so" \
  "${pkgdir}/usr/lib/weechat/plugins/libweecord.so"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
