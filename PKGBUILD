# Maintainer: bilabila <bilabila@qq.com>
_pkgname=netease-cloud-music-unblock-enhanced
pkgname=$_pkgname-git
pkgver=r667.dbb73aa
pkgrel=2
pkgdesc='Revive unavailable songs for Netease Cloud Music (Refactored & Enhanced version)'
arch=(x86_64)
url=https://github.com/UnblockNeteaseMusic/server
provides=($_pkgname)
conflicts=($_pkgname)
license=(LGPL3)
depends=(nss nodejs netease-cloud-music)
source=(git+https://github.com/UnblockNeteaseMusic/server
  netease-cloud-music-unblock-enhanced)
sha512sums=(SKIP
  ce4d0bf8a0e4ef86c15b16d98be5281a88afcdb93b2657a21f45d69e6c51316dbf1b297df97da4bc07cd221646b772136b4292cbb2b71e8426399adafeff36b1)
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
