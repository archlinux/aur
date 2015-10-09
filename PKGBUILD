# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=gnome-shell-extension-suspend-button-git
pkgver=r17.181a467
pkgrel=1
pkgdesc="Allows to modify the suspend/shutdown button in the status menu."
arch=('i686' 'x86_64')
url="https://github.com/laserb/gnome-shell-extension-suspend-button"
license=('GPL')
depends=('gnome-shell')
makedepends=('git')
install=gnome-shell-extension-suspend-button.install
source=("$pkgname::git+https://github.com/laserb/gnome-shell-extension-suspend-button"
        "gnome-shell-version.patch")
sha256sums=('SKIP'
            '02ca0deeb19b203047723361ee6f2e45ad98216a7b2462aeb1cf0ffd8c0bc9d2')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  patch -p0 -i "$srcdir/gnome-shell-version.patch"
}

package() {
  cd "$pkgname"
  _uuid='suspend-button@laserb'

  install -Dm644 "metadata.json" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/metadata.json"
  install -m644 "extension.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/extension.js"
  install -m644 "prefs.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/prefs.js"
  install -m644 "lib.js" \
    "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/lib.js"
  install -Dm644 "schemas/org.gnome.shell.extensions.suspend-button.gschema.xml" \
    "${pkgdir}/usr/share/glib-2.0/schemas/org.gnome.shell.extensions.suspend-button.gschema.xml"
}
