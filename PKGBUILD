# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-hotkeys-popup-git
pkgver=4.r10.g0b11b5e
pkgrel=1
pkgdesc="GNOME Shell Extension that displays currently configured Gnome hotkeys in a popup."
arch=('any')
url="https://github.com/mipmip/gnome-shell-extensions-hotkeys-popup"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git' 'zip')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(${pkgname%-git}::git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
