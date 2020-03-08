# Maintainer: Ben Brooks <ben@bbrks.me>

# PRs/Issues: https://github.com/bbrks/aur-portainer-bin

pkgname=portainer-bin
pkgver=1.23.1
pkgrel=1
epoch=
pkgdesc="A lightweight docker management UI"
arch=('x86_64')
url="https://github.com/portainer/portainer"
license=('custom:zlib')
provides=('portainer')
conflicts=('portainer')

source=("portainer.service"
        "portainer-${pkgver}-src.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "${url}/releases/download/${pkgver}/portainer-${pkgver}-linux-amd64.tar.gz")
sha256sums=('968c0ce3d182e7daad58b02d2fd640a6944b2a2367ee5b3e3fc9f8139cdfc2bf'
            'a2b2942e3c5a079822a9d88d611f3789d312c2f673f4554fca0be486fe4aff70'
            'e161fdc6c54a2feb73ced0ef8369aaf216531b807f30269ec1a28e13a8ff9397')
package() {
  install -Dm644 "${srcdir}/portainer-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 "${srcdir}/portainer/portainer" "${pkgdir}/usr/bin/portainer"
  install -Dm644 "${srcdir}/portainer/templates.json" "${pkgdir}/etc/portainer/templates.json"
  install -Dm644 "${srcdir}/portainer/extensions.json" "${pkgdir}/usr/lib/portainer/extensions.json"
  cp -r "${srcdir}/portainer/public" "${pkgdir}/usr/lib/portainer/public"

  install -Dm644 "portainer.service" "${pkgdir}/usr/lib/systemd/system/portainer.service"
}

