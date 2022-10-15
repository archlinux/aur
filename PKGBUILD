# Maintainer: Star_caorui <Star_caorui@hotmail.com>
pkgname=mcsm-web-git
pkgver=9.4.5
pkgrel=1
pkgdesc="适用于 MCSManager 的面板端（Web）程序。"
arch=(x86_64)
url="https://github.com/MCSManager/MCSManager-Web-Production"
license=(AGPL)
install=$pkgname.install
depends=('nodejs>=14')
makedepends=('npm')
source=('file://mcsm-web.service'
        'web::git+https://github.com/MCSManager/MCSManager-Web-Production')
sha256sums=('5f85e25231e3d4119c215a3ee00e1ae6dd000d8c55c1b8f32194868f882305cc'
            'SKIP')

build() {
  cd web
  npm install --registry=https://registry.npm.taobao.org
}

package() {
  [ ! -d "${pkgdir}"/etc/systemd/system/ ] && install -dm755 "${pkgdir}"/etc/systemd/system/
  install -dm755 "${pkgdir}"/opt/mcsmanager/
  install -m644 mcsm-web.service "${pkgdir}"/etc/systemd/system/
  cp -r web "${pkgdir}"/opt/mcsmanager/
}
