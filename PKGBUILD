# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ni-translate-git
pkgver=r71.4744cf1
pkgrel=1
pkgdesc='A translator for Linux, running at the background which wakes up with the translation of the last selected text after tapping the specific key twice'
arch=('i686' 'x86_64')
url='https://github.com/yasirtug/ni-translate'
license=('GPL3')
provides=('ni-translate')
depends=('qt5-base')
makedepends=('qt5-base' 'gendesk')
source=("${pkgname%-git}::git+https://github.com/yasirtug/ni-translate")
sha256sums=('SKIP')

pkgver() {
  cd ni-translate
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd ni-translate
  qmake -spec linux-g++
  make
}

package() {
  cd ni-translate
  gendesk -f -n --pkgname "${pkgname%-git}" \
            --pkgdesc "$pkgdesc" \
            --name "ni-translate" \
            --comment "$pkgdesc" \
            --exec "${pkgname%-git}" \
            --categories 'Utility' \
            --icon "${pkgname%-git}"
  install -Dm644 ni-translate.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm755 ni-translate -t "${pkgdir}/usr/bin"
  install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/ni-translate.png"
}