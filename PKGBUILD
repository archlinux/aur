# Maintainer : nerfingen <nerfingen at yahoo dot de>

_pkgname=weechat-discord
pkgname=weechat-discord-git
pkgver=r65.e30de7f
pkgrel=1
pkgdesc="Discord plugin for weechat"
arch=('i686' 'x86_64')
url="https://github.com/khyperia/weechat-discord"
license=('MIT')
depends=('weechat' 'openssl-1.0')
makedepends=('git' 'rust')
optdepends=()
source=("${_pkgname}::git+https://github.com/khyperia/weechat-discord.git")
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
