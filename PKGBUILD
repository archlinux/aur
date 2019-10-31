# Maintainer : nerfingen <nerfingen@yahoo.de>

_pkgname=weechat-discord
pkgname=weechat-discord-git
pkgver=r285.55eabd4
pkgrel=1
pkgdesc="Discord plugin for weechat"
arch=('i686' 'x86_64')
url="https://github.com/terminal-discord/weechat-discord"
license=('MIT')
depends=('weechat' 'openssl-1.0')
makedepends=('git' 'rust')
optdepends=()
source=("${_pkgname}::git+https://github.com/terminal-discord/weechat-discord.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  make
}

package() {
  cd "${_pkgname}"

  install -D "target/release/libweecord.so" \
  "${pkgdir}/usr/lib/weechat/plugins/libweecord.so"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
