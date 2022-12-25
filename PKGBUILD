# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-privacy-menu
pkgver=9.0
pkgrel=1
pkgdesc="Privacy Quick Settings Menu GNOME Extension"
arch=('any')
url="https://github.com/stuarthayhurst/privacy-menu-extension"
license=('GPL3')
depends=('glib2' 'gnome-shell')
makedepends=('git')
checkdepends=('appstream-glib')
_commit=15c263588de3526d8682ce5f9703882a594c5659 # tags/9.0^0
source=("$pkgname::git+$url.git#commit=$_commit")
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
  bsdtar -xvf ${uuid}.shell-extension.zip -C "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
}
