# Maintainer: Drommer <drommer@github.com>

_gitname=gnome-volume-mixer
_uuid=volume-mixer@evermiss.net
pkgname=gnome-shell-extension-application-volume-mixer
pkgver=11
pkgrel=1
pkgdesc="Gnome extension that adds volume sliders for every application emitting audio in the system menu"
arch=('any')
url="https://github.com/mymindstorm/gnome-volume-mixer/"
license=('MIT')
depends=('gnome-shell')
makedepends=('npm')
source=("https://github.com/mymindstorm/$_gitname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b5ec1613ab8e203ffbdab8b58cd7a5c7d74a8ed1cbb1705be1acce8c431ce328')

build() {
  cd $_gitname-$pkgver
  npm install
  npm run build
}

package() {
  cd $_gitname-$pkgver
  install -Dm644 "dist/schemas/net.evermiss.mymindstorm.volume-mixer.gschema.xml" -t "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas"
  install -Dm644 "dist/schemas/gschemas.compiled" -t "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas"
  install -Dm644 "dist/extension.js" -t "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  install -Dm644 "dist/metadata.json" -t "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  install -Dm644 "dist/prefs.js" -t "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
}
