# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-privacy-menu
pkgver=11.0
pkgrel=1
pkgdesc="Privacy Quick Settings Menu GNOME Extension"
arch=('any')
url="https://github.com/stuarthayhurst/privacy-menu-extension"
license=('GPL3')
depends=('glib2' 'gnome-shell')
makedepends=('git')
checkdepends=('appstream-glib')
source=($pkgname::git+$url.git#tag=v$pkgver)
b2sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname

  make build
}

package() {
  cd $pkgname

  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' extension/metadata.json)
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar -xvf build/${uuid}.shell-extension.zip -C "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
}
