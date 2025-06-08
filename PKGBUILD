# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>
# The official web build doesn't exists since v1.5
# I build it myself and share the package 

_pkgname=fluffychat
pkgname=fluffychat-web-bin
pkgver=1.27.0
pkgrel=1
pkgdesc="Chat with your friends"
arch=('any')
url="https://fluffychat.im/"
license=('AGPL3')
makedepends=()
optdepends=()
provides=("fluffychat-web")
conflicts=("fluffychat-web")
source=(
  "fluffychat-web-${pkgver}.tar.gz::https://github.com/krille-chan/fluffychat/releases/download/v${pkgver}/fluffychat-web.tar.gz"
  "config-${pkgver}.sample.json::https://raw.githubusercontent.com/krille-chan/fluffychat/v${pkgver}/config.sample.json"
)
noextract=(
    "fluffychat-web-${pkgver}.tar.gz"
)
sha256sums=('fcfd3fd886a8fa4a1b4561cf40bed1fb998cce8bd34d0cc164023471b219c9a7'
            'c17a181d58527d4cc23bcf5534d61add1abc0da542ee22080d5bd6242c4c12d7')
backup=(
    "etc/webapps/${_pkgname}/config.json"
)

package() {  
  install -dm755 ${pkgdir}/usr/share/webapps/${_pkgname}
  tar xzf "fluffychat-web-${pkgver}.tar.gz" -C ${pkgdir}/usr/share/webapps/${_pkgname} --strip=2
  install -Dm644 "config-${pkgver}.sample.json" ${pkgdir}/etc/webapps/${_pkgname}/config.json
  ln -s /etc/webapps/${_pkgname}/config.json ${pkgdir}/usr/share/webapps/${_pkgname}
  sed -i '/base href=/d' ${pkgdir}/usr/share/webapps/${_pkgname}/index.html
}

# vim: set sw=2 ts=2 et:
