# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Tom Wagner <tom dot a dot wagner at protonmail dot com>
# Contributor: smcdougall <simon at sjmcdougall dot com>
pkgname=gnome-shell-extension-multi-monitors-add-on-git
_uuid=multi-monitors-add-on@spin83
pkgver=r146.67af601
pkgrel=1
epoch=2
pkgdesc="Add multiple monitors overview and panel for gnome-shell."
arch=('any')
url="https://github.com/lazanet/multi-monitors-add-on"
license=('GPL-2.0-or-later')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/lazanet/multi-monitors-add-on.git')
sha256sums=('SKIP')

pkgver() {
  cd multi-monitors-add-on
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd multi-monitors-add-on
  install -d "$pkgdir/usr/share/gnome-shell/extensions/"
  cp -a "${_uuid}/" "$pkgdir/usr/share/gnome-shell/extensions/"

  install -Dm644 "${_uuid}/schemas/org.gnome.shell.extensions.multi-monitors-add-on.gschema.xml" -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"

  for lang in de es fr it pl pt_BR; do
    install -Dm644 "${_uuid}/locale/${lang}/LC_MESSAGES/multi-monitors-add-on.mo" -t \
      "$pkgdir/usr/share/locale/${lang}/LC_MESSAGES/"
  done

  rm -vr "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"/{locale,schemas}
  rm -v "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/multi-monitors-add-on.pot"
}

