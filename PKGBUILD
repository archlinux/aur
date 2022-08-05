# Maintainer: XiaYeSuiFeng <xiayesuifeng@firerain.me>
pkgname=gopanel-bin
_pkgname=gopanel
pkgver=0.2.0
pkgrel=1
pkgdesc='A control panel that is written in Golang and is able to manage Caddy 2'
arch=('x86_64')
license=('GPLv3')
url='https://gitlab.com/xiayesuifeng/gopanel'
backup=('etc/gopanel/config.json')
depends=('caddy')
makedepends=('unzip')
source=("${_pkgname}-${pkgver}.zip::https://gitlab.com/xiayesuifeng/${_pkgname}/-/jobs/artifacts/${pkgver}/download?job=build-gopanel")
sha256sums=('5f12eee304854ec8579d0f626abd51a9b89cb5b182e55cb451d4e8c4519b4af2')

package() {
  cd ${srcdir}/gopanel
  mkdir -p "$pkgdir/etc/gopanel/app.conf.d"
  mkdir -p "$pkgdir/usr/share/gopanel"
  install -D -m 0755 gopanel "$pkgdir/usr/bin/gopanel"
  install -D -m 0644 systemd/gopanel.service "$pkgdir/usr/lib/systemd/system/gopanel.service"
  install -D -m 0644 config.default.json "$pkgdir/etc/gopanel/config.json"
  sed -i 's|http://localhost:2019|unix//run/caddy/admin.socket|g' "$pkgdir/etc/gopanel/config.json"
  cp -rf web "${pkgdir}/usr/share/gopanel/web"
  chmod -R 0644 "${pkgdir}/usr/share/gopanel/web"
}
