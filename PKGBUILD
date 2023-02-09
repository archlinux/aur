# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-shell-extension-space-bar-git
pkgver=r28.7582c18
pkgrel=1
pkgdesc="GNOME Shell extension that shows workspaces buttons in top panel"
arch=('any')
url="https://github.com/christopher-l/space-bar"
license=('GPL')
depends=('gnome-shell')
makedepends=('git' 'typescript')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/christopher-l/space-bar.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/space-bar"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/space-bar"
  sh scripts/build.sh
}

package() {
  cd "$srcdir/space-bar"
  _uuid=space-bar@luchrioh

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/"

  install -Dm644 target/schemas/org.gnome.shell.extensions.space-bar.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
