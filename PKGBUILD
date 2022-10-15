# Maintainer: Star_caorui <Star_caorui@hotmail.com>
pkgname=mcsm-daemon-git
pkgver=1.5.5
pkgrel=2
pkgdesc="适用于 MCSManager 的守护（daemon）程序。"
arch=(x86_64)
url="https://github.com/MCSManager/MCSManager-Daemon-Production"
license=(AGPL)
install=$pkgname.install
depends=('nodejs>=14')
makedepends=('npm')
source=('file://mcsm-daemon.service'
        'daemon::git+https://github.com/MCSManager/MCSManager-Daemon-Production')
sha256sums=('56a03d9b7a65fcbb41c3d19433a0e8dc4f99f909470691c4792399957d3323b8'
            'SKIP')

build() {
  cd daemon
  npm install --registry=https://registry.npm.taobao.org
}

package() {
  [ ! -d "${pkgdir}"/etc/systemd/system/ ] && install -dm755 "${pkgdir}"/etc/systemd/system/
  install -dm755 "${pkgdir}"/opt/mcsmanager/
  install -m644 mcsm-daemon.service "${pkgdir}"/etc/systemd/system/
  cp -r daemon "${pkgdir}"/opt/mcsmanager/
}
