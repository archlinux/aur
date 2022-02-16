# Maintainer: Ranieri Althoff <ranisalt+aur at gmail dot com>

pkgname=gnome-shell-extension-hot-edge-git
pkgver=14
pkgrel=1
pkgdesc='Adds a hot edge that activates the overview to the bottom of the screen.'
url='https://github.com/jdoda/hotedge'
license=('GPL')
arch=('any')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
makedepends=('git' 'jq')
depends=('gnome-shell>=40')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  jq -r '.version' < "$pkgname/metadata.json"
}

build() {
  make -C "$pkgname" schemas/gschemas.compiled
}

package() {
  cd "$pkgname"

  install -Dm644 -t "$pkgdir/usr/share/gnome-shell/extensions/hotedge@jonathan.jdoda.ca" extension.js logger.js metadata.json prefs.js stylesheet.css
  install -Dm644 -t "$pkgdir/usr/share/gnome-shell/extensions/hotedge@jonathan.jdoda.ca/schemas" schemas/org.gnome.shell.extensions.hotedge.gschema.xml schemas/gschemas.compiled
}
