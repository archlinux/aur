# Maintainer: Torben <git at letorbi dot com>
# Contributor: Ranieri Althoff <ranisalt+aur at gmail dot com>

pkgname=gnome-shell-extension-hot-edge-git
pkgver=22.r55.0aeda4b
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
  cd "$pkgname"
  printf "%s.r%s.%s" "$(jq -r '.version' < metadata.json)" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  make -C "$pkgname" schemas/gschemas.compiled
}

package() {
  cd "$pkgname"

  install -Dm644 -t "$pkgdir/usr/share/gnome-shell/extensions/hotedge@jonathan.jdoda.ca" extension.js metadata.json prefs.js stylesheet.css
  install -Dm644 -t "$pkgdir/usr/share/gnome-shell/extensions/hotedge@jonathan.jdoda.ca/schemas" schemas/org.gnome.shell.extensions.hotedge.gschema.xml schemas/gschemas.compiled
}
