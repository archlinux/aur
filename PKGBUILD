# Maintainer: bilabila <bilabila@qq.com>
_pkgname=netease-cloud-music-unblock-enhanced
pkgname=$_pkgname-git
pkgver=r1263.d731b75
pkgrel=5
pkgdesc='Revive unavailable songs for Netease Cloud Music (Refactored & Enhanced version)'
arch=(x86_64)
url=https://github.com/UnblockNeteaseMusic/server
provides=($_pkgname)
conflicts=($_pkgname)
license=(LGPL3)
depends=(p11-kit nodejs netease-cloud-music)
optdepends=('yt-dlp: youtube provider')
source=(git+https://github.com/UnblockNeteaseMusic/server
  netease-cloud-music-unblock-enhanced)
sha512sums=(SKIP SKIP)
install=unblock.install
pkgver() {
  cd server
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
  mkdir -p "$pkgdir"/usr/share/$_pkgname
  rsync -a server/ "$pkgdir"/usr/share/$_pkgname/ --exclude .git/
  install -Dm644 server/COPYING "$pkgdir"/usr/share/licenses/$_pkgname/COPYING
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
}
