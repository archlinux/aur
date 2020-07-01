# Maintainer: XiaYeSuiFeng <xiayesuifeng@firerain.me>
pkgname=gopanel-bin
pkgver=0.0.1
pkgrel=1
pkgdesc='A control panel that is written in Golang and is able to manage Caddy 2'
arch=('x86_64')
license=('GPLv3')
url='https://gitlab.com/xiayesuifeng/gopanel'
backup=('etc/gopanel/config.json')
depends=('caddy2')
makedepends=('unzip')
source=("${pkgname}-${pkgver}.zip::https://gitlab.com/xiayesuifeng/${pkgname}/-/jobs/artifacts/${pkgver}/download?job=build-gopanel")
sha256sums=('4899739b7d119ab30d935a37992d5d16ff8f509e6e7c9b7baecd9bef0ede47ca')

package() {
  cd ${srcdir}/gopanel

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "$pkgdir/etc/gopanel/app.conf.d"
  mkdir -p "$pkgdir/usr/share/gopanel"
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  install -D -m 0755 gopanel "$pkgdir/usr/bin/gopanel"
  install -D -m 0644 systemd/gopanel.service "$pkgdir/usr/lib/systemd/system/gopanel.service"
  install -D -m 0644 config.default.json "$pkgdir/etc/gopanel/config.json"
  cp -rf web "${pkgdir}/usr/share/gopanel/web"
  chmod -R 0644 "${pkgdir}/usr/share/gopanel/web"
}
