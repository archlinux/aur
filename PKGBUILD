# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extensions-hotkeys-popup-git
pkgver=r68.41533a4
pkgrel=1
pkgdesc="GNOME Shell Extension that displays currently configured Gnome hotkeys in a popup."
arch=('any')
url="https://github.com/mipmip/gnome-shell-extensions-hotkeys-popup"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git' 'zip')
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${pkgname%-git}"

  ./install.sh zip
}

package() {
  _uuid='hotkeys-popup@pimsnel.com'
  cd "${pkgname%-git}"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  bsdtar -xvf $_uuid.zip -C "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
}
