# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-dynamic-panel-transparency-git
_uuid=dynamic-panel-transparency@rockon999.github.io
pkgver=35.r342.4ed748a
pkgrel=2
pkgdesc="Adds Transparency To The Gnome Shell Panel"
arch=('any')
url="https://ewlsh.github.io/dynamic-panel-transparency"
license=('GPL-2.0-or-later')
depends=('gnome-shell<=1:44.6')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/ewlsh/dynamic-panel-transparency.git')
sha256sums=('SKIP')

pkgver() {
  cd dynamic-panel-transparency
  printf "35.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd dynamic-panel-transparency
  install -d "$pkgdir/usr/share/gnome-shell/extensions"
  cp -r "$_uuid" "$pkgdir/usr/share/gnome-shell/extensions/"

  mv "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/locale" "$pkgdir/usr/share/"

  install -Dm644 "$_uuid/schemas/org.gnome.shell.extensions.dynamic-panel-transparency.gschema.xml" -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas"

  rm "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"/{dynamic-panel-transparency.pot,COPYING,LICENSE}
}
