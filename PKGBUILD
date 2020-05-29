# Maintainer: Ben Brooks <ben@bbrks.me>

# PRs/Issues: https://github.com/bbrks/aur-portainer-bin

pkgname=portainer-bin
pkgver=1.24.0
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
            '8e7dfcd69d4b400d5c2170545bb4c8d89a2dc3aecc6b48a1e6fe3350c90f1db1'
            '99b568b32d70b24da4ffd791b809eb1927af5b81af1ad1b7fbe129c4377e300b')

package() {
  install -Dm644 "${srcdir}/portainer-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 "${srcdir}/portainer/portainer" "${pkgdir}/usr/bin/portainer"
  install -Dm644 "${srcdir}/portainer/templates.json" "${pkgdir}/etc/portainer/templates.json"
  install -Dm644 "${srcdir}/portainer/extensions.json" "${pkgdir}/usr/share/portainer/extensions.json"
  cp -r "${srcdir}/portainer/public" "${pkgdir}/usr/share/portainer/public"

  install -Dm644 "portainer.service" "${pkgdir}/usr/lib/systemd/system/portainer.service"
}
