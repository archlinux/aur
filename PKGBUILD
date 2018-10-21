# Maintainer: rc.poison <rc dot poison at gmail dot com>

pkgbase=dxvk-cache-pool-git
_pkgname=dxvk-cache-pool
pkgname=("dxvk-cache-client-git" "dxvk-cache-server-git")
pkgver=1.0.1.r0.gaa9c5e9
pkgrel=1
pkgdesc='Client/server to share DXVK pipeline caches for smoother wine gaming.'
arch=('any')
url='https://github.com/rcpoison/dxvk-cache-pool'
license=('Apache 2')
depends=('java-runtime>=8')
makedepends=('git' 'maven' 'java-environment>=8')
source=('git+https://github.com/rcpoison/dxvk-cache-pool.git')
sha1sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd "$_pkgname"
  ./build.sh
}

package_dxvk-cache-server-git() {
  cd "$_pkgname"
  install -Dm755 dxvk-cache-server -t "$pkgdir"/usr/bin
  install -Dm644 dxvk-cache-server.service -t "$pkgdir"/usr/lib/systemd/system/
}

package_dxvk-cache-client-git() {
  cd "$_pkgname"
  install -Dm755 dxvk-cache-client -t "$pkgdir"/usr/bin
  install -Dm755 dxvk-cache-pool.sh -t "$pkgdir"/etc/profile.d
}
