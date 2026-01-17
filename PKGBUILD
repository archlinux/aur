# Maintainer: Toadtoad <kingdomkeepersguy@gmail.com>
pkgname=desktop-gremlin-git
pkgver=r107.e9b118e
pkgrel=1
pkgdesc="A desktop pet/gremlin"
arch=('x86_64')
url="https://github.com/iluvgirlswithglasses/linux-desktop-gremlin"
license=('MIT')

depends=('pyside6' 'qt6-base')
optdepends=('picom: tiling x11 wm support' 'xorg-xwayland: wayland support')
provides=('desktop-gremlin')
conflicts=('desktop-gremlin')

source=(
  "git+https://github.com/iluvgirlswithglasses/linux-desktop-gremlin.git"
  "desktop-gremlin.sh"
  "gremlin-picker.sh"
  "gremlin-picker.desktop"
)

sha256sums=(
  "SKIP"
  "5cd5703070f5a49edc6822ffea7188ee6f78dc137321f02111cfad592baef38f"
  "34da1a6a26430295d6e8f7ba95797f62fa0dfdfecb38d52a76210230283c73b7"
  "6ee18aeea7141286b2636d4a2064d38ffda9b517e21c5fc28a1ca84c16024c61"
)

pkgver() {
  cd "${srcdir}/linux-desktop-gremlin"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -dm755 "${srcdir}/linux-desktop-gremlin" "${pkgdir}/opt/desktop-gremlin"
  cp -rf "${srcdir}/linux-desktop-gremlin/." "${pkgdir}/opt/desktop-gremlin/"
  rm -rf "${pkgdir}/opt/desktop-gremlin/.git"
  install -Dm666 "${srcdir}/linux-desktop-gremlin/config.json" "${pkgdir}/opt/desktop-gremlin/config.json"
  install -Dm755 "${srcdir}/desktop-gremlin.sh" "${pkgdir}/usr/bin/desktop-gremlin"
  install -Dm755 "${srcdir}/gremlin-picker.sh" "${pkgdir}/usr/bin/gremlin-picker"
  install -Dm644 "${srcdir}/linux-desktop-gremlin/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname/-git/}/LICENSE"
  install -Dm755 "${srcdir}/gremlin-picker.desktop" "${pkgdir}/usr/share/applications/gremlin-picker.desktop"
}
