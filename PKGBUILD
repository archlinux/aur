# Maintainer: Ben Brooks <ben@bbrks.me>

# PRs/Issues: https://github.com/bbrks/aur-portainer-bin

pkgname=portainer-bin
pkgver=1.24.1
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
sha256sums=('38f8e91194fb3c07275b26a7b4a0215bab454baa556b0fece37cdce58317b16e'
            '2e95a348a6be1cf10e038193ec1d236f12ee5d6575f68e2da1de052ea26bc1bc'
            'fadcf340a259ad112dcf10feb46dd3792e926475fafbdbe536c6525c1eba3831')

package() {
  install -Dm644 "${srcdir}/portainer-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 "${srcdir}/portainer/portainer" "${pkgdir}/usr/bin/portainer"
  install -Dm644 "${srcdir}/portainer/templates.json" "${pkgdir}/etc/portainer/templates.json"
  install -Dm644 "${srcdir}/portainer/extensions.json" "${pkgdir}/usr/share/portainer/extensions.json"
  cp -r "${srcdir}/portainer/public" "${pkgdir}/usr/share/portainer/public"

  install -Dm644 "portainer.service" "${pkgdir}/usr/lib/systemd/system/portainer.service"
}
