# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>
# The official web build doesn't exists since v1.5
# I build it myself and share the package 

_pkgname=fluffychat
pkgname=fluffychat-web-bin
pkgver=1.8.0
pkgrel=2
pkgdesc="Chat with your friends"
arch=('any')
url="https://fluffychat.im/"
license=('AGPL3')
makedepends=()
optdepends=()
provides=("fluffychat-web")
conflicts=("fluffychat-web")
source=(
  "fluffychat-web-${pkgver}.tar.gz::https://static.celogeek.com/AUR/fluffychat-web/fluffychat-web-${pkgver}.tar.gz"
  "config-${pkgver}.sample.json::https://gitlab.com/famedly/fluffychat/-/raw/v${pkgver}/config.sample.json"
)
noextract=(
    "fluffychat-web-${pkgver}.tar.gz"
)
sha256sums=('a761ca47a2c0a6405fa38b361cdcaad209452444a31f0bee9a3ffe54a80abb49'
            'c17a181d58527d4cc23bcf5534d61add1abc0da542ee22080d5bd6242c4c12d7')
backup=(
    "etc/webapps/${_pkgname}/config.json"
)

package() {  
  install -dm755 ${pkgdir}/usr/share/webapps/${_pkgname}
  tar xzf "fluffychat-web-${pkgver}.tar.gz" -C ${pkgdir}/usr/share/webapps/${_pkgname}
  install -Dm644 "config-${pkgver}.sample.json" ${pkgdir}/etc/webapps/${_pkgname}/config.json
  ln -s /etc/webapps/${_pkgname}/config.json ${pkgdir}/usr/share/webapps/${_pkgname}
  sed -i '/base href=/d' ${pkgdir}/usr/share/webapps/${_pkgname}/index.html
}

# vim: set sw=2 ts=2 et:
