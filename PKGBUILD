# Maintainer: Relwi <theofficialdork@hotmail.com>
pkgname=fast-discord-git
pkgver=r213.17e593e
pkgrel=1
pkgdesc='A new Discord client made in C++ and Qt'
url='https://github.com/EnyoYoen/Fast-Discord'
source=("${pkgname}::git+https://github.com/EnyoYoen/Fast-Discord")
arch=('any')
license=('MIT')
makedepends=('cmake')
depends=('git' 'pacman' 'qt5-base' 'opus' 'libsodium' 'qt5-websockets' 'qt5-multimedia')
md5sums=('SKIP')

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
}
