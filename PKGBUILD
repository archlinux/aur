# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-tiling-assistant
_pkgname=Tiling-Assistant
pkgver=36
pkgrel=1
pkgdesc="A GNOME Shell extension to expand GNOME's native 2 column design."
arch=('any')
url="https://github.com/Leleat/Tiling-Assistant"
license=('GPL2')
depends=('gnome-shell')
install='INSTALL'
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
_source=tiling-assistant
noextract=("*tiling-assistant@leleat-on-github*")
b2sums=('23c009689762b96a87420f450c262eb911f3858114ccc8cac72586f8c40c83b68d05500efa6edcf08465b5db50f2cb5f9f5e286a4bbe73f7597ad326e90c7fe2')

build() {
  cd "${srcdir}/Tiling-Assistant-${pkgver}"

  gnome-extensions pack tiling-assistant@leleat-on-github \
    --force \
    --podir="../translations" \
    --extra-source="src"
}

package() {
  cd "${srcdir}/Tiling-Assistant-${pkgver}"
  _uuid="tiling-assistant@leleat-on-github"

  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  bsdtar xvf ${_uuid}.shell-extension.zip \
    -C "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/"

  install -Dm644 "$_uuid/schemas/org.gnome.shell.extensions.${_source}.gschema.xml" -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"

  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas/"
}
