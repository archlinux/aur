# Maintainer: Achmad Fathoni <fathoni DOT id AT gmail DOT com>

pkgname=moodyrain-git
_pkgname=moodyrain
pkgver=r11.9eded08
pkgrel=2
pkgdesc="Generate custom ambient soundscapes on Linux"
arch=('any')
url='https://github.com/glutanimate/MoodyRain'
license=('GPL3')
provides=('moodyrain')
depends=('yad' 'sox' 'vorbis-tools')
makedepends=('git' 'gendesk')
source=("moodyrain::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd moodyrain
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd moodyrain
  install -d "${pkgdir}/opt/MoodyRain" "${pkgdir}/usr/bin"
  cp -avR sounds icons moodyrain "${pkgdir}/opt/MoodyRain"
  ln -s /opt/MoodyRain/moodyrain "${pkgdir}/usr/bin/moodyrain"
  gendesk -f -n --pkgname "${pkgname%-git}" \
          --pkgdesc "$pkgdesc" \
          --name "MoodyRain" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-git}" \
          --categories 'Utility;Audio;AudioVideo' \
          --icon preferences-desktop-multimedia
  install -Dm644 moodyrain.desktop -t "${pkgdir}/usr/share/applications/"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
