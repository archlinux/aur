# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Tom Wagner <tom dot a dot wagner at protonmail dot com>
# Contributor: smcdougall <simon at sjmcdougall dot com>
pkgname=gnome-shell-extension-multi-monitors-add-on-git
_uuid=multi-monitors-add-on@spin83
pkgver=19.r49.gd8ea040
pkgrel=1
epoch=1
pkgdesc="Adds panels and thumbnails for additional monitors."
arch=('any')
url="https://github.com/realh/multi-monitors-add-on"
license=('GPL-2.0-or-later')
depends=('gnome-shell<=1:44.6')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/realh/multi-monitors-add-on.git')
sha256sums=('SKIP')

pkgver() {
  cd multi-monitors-add-on
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd multi-monitors-add-on

  install -d "$pkgdir/usr/share/gnome-shell/extensions/"
  cp -a "$_uuid/" "$pkgdir/usr/share/gnome-shell/extensions/"

  install -Dm644 "$_uuid/schemas/org.gnome.shell.extensions.multi-monitors-add-on.gschema.xml" -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"

  for lang in de es fr it pl pt_BR; do
    install -Dm644 "locale/${lang}/LC_MESSAGES/multi-monitors-add-on.mo" -t \
      "$pkgdir/usr/share/locale/${lang}/LC_MESSAGES/"
  done

  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"/{locale,schemas}
  rm "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/multi-monitors-add-on.pot"
}

