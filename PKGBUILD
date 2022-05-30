# Maintainer: Star_caorui <Star_caorui@hotmail.com>
pkgname=mcsm-daemon-git
pkgver=9.4.4
pkgrel=1
pkgdesc="适用于 MCSManager 的守护（daemon）程序。"
arch=(x86_64)
url="https://github.com/MCSManager/MCSManager-Daemon-Production"
license=(AGPL)
install=$pkgname.install
depends=('nodejs>=14')
makedepends=('npm')
source=('file://mcsm-daemon.service'
        'daemon::git+https://github.com/MCSManager/MCSManager-Daemon-Production')
sha256sums=('5f85e25231e3d4119c215a3ee00e1ae6dd000d8c55c1b8f32194868f882305cc'
            'SKIP')

build() {
  cd daemon
  npm install --registry=https://registry.npm.taobao.org
}

package() {
  [ ! -d "${pkgdir}"/etc/systemd/system/ ] && install -dm755 "${pkgdir}"/etc/systemd/system/
  install -dm755 "${pkgdir}"/opt/mcsmanager/
  install -m755 mcsm-daemon.service "${pkgdir}"/etc/systemd/system/
  cp -r daemon "${pkgdir}"/opt/mcsmanager/
}
