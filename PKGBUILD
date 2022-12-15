# Maintainer: Relwi <theofficialdork@hotmail.com>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=fast-discord-git
pkgver=r232.f14ee21
pkgrel=1
pkgdesc='A new Discord client made in C++ and Qt'
url='https://github.com/EnyoYoen/Fast-Discord'
source=("${pkgname}::git+https://github.com/EnyoYoen/Fast-Discord")
arch=(x86_64 arm aarch64)
license=(MIT)
depends=(qt5-base qt5-multimedia qt5-websockets opus libsodium)
makedepends=(cmake git)
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
  cd "$pkgname/bin"

  cmake ..
  cmake --build .
}

package() {
  cd "$pkgname"
  
  install -Dm755 bin/Fast-Discord "${pkgdir}/usr/bin/fast-discord"
  install -Dm644 "resources/com.enyoyoen.fast-discord.desktop" "$pkgdir/usr/share/applications/com.enyoyoen.fast-discord.desktop"
  install -Dm644 "doc/images/Fast-Discord-Logo.png" "$pkgdir/usr/share/pixmaps/fast-discord.png"
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
