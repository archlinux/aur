# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Tom Wagner <tom dot a dot wagner at protonmail dot com>
# Contributor: smcdougall <simon at sjmcdougall dot com>
pkgname=gnome-shell-extension-multi-monitors-add-on-git
_pkgname=multi-monitors-add-on
pkgver=19.r40.g0b54630
pkgrel=1
epoch=1
pkgdesc="Adds panels and thumbnails for additional monitors."
arch=('any')
url="https://github.com/realh/multi-monitors-add-on"
license=('GPL2')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/realh/multi-monitors-add-on.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"

  _uuid="$_pkgname@spin83"

  install -d "$pkgdir/usr/share/gnome-shell/extensions/"
  cp -a "$_uuid/" "$pkgdir/usr/share/gnome-shell/extensions/"

  install -Dm644 "$_uuid/schemas/org.gnome.shell.extensions.$_pkgname.gschema.xml" -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"

  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas/"
  rm "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/$_pkgname.pot"
}

