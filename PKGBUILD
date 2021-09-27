# Maintainer: bilabila <bilabila@qq.com>
_pkgname=netease-cloud-music-unblock-enhanced
pkgname=$_pkgname-git
pkgver=r50.3fb606d
pkgrel=1
pkgdesc='Revive unavailable songs for Netease Cloud Music (Refactored & Enhanced version)'
arch=(x86_64)
url=https://github.com/UnblockNeteaseMusic/server
provides=($_pkgname)
conflicts=($_pkgname)
license=(MIT)
depends=(nss nodejs netease-cloud-music)
source=(git+https://github.com/UnblockNeteaseMusic/server
  netease-cloud-music-unblock-enhanced)
sha512sums=(SKIP
  227caf3ab5a3d2212df9f9606377cd46cdf44880430738252949096d69b643d2029246a89621eed18853e102d5f8c78d50d3f3ccd07198a10025f2600ffd1baf)
pkgver() {
  cd $_srcname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
  mkdir -p "$pkgdir"/usr/share/$_pkgname
  rsync -a server/ "$pkgdir"/usr/share/$_pkgname/ --exclude .git/
  install -Dvm644 server/LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dvm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
}
