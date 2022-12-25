# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-privacy-menu-git
pkgver=9.0.r1.g83cdad5
pkgrel=1
pkgdesc="Privacy Quick Settings Menu GNOME Extension"
arch=('any')
url="https://github.com/stuarthayhurst/privacy-menu-extension"
license=('GPL3')
depends=('glib2' 'gnome-shell')
makedepends=('git')
checkdepends=('appstream-glib')
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

  make build
}

package() {
  cd "${pkgname%-git}"

  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' extension/metadata.json)
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar -xvf ${uuid}.shell-extension.zip -C "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
}
