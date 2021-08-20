# Maintainer: Eric Cheng <ericcheng@hey.com>

pkgname=gnome-shell-extension-alphabetical-grid-extension
_pkgname=alphabetical-grid-extension
pkgver=11.0
pkgrel=2
pkgdesc="Restore the alphabetical ordering of the app grid, removed in GNOME 3.38 "
arch=('any')
url="https://github.com/stuarthayhurst/alphabetical-grid-extension"
license=('GPL3')
depends=('gnome-shell>=3.38')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('50238993911dcf0f6e4d60d83cbf5d55492dc3346945116225bec57f9f9b8b95')

build() {
  cd "${srcdir}"/${_pkgname}-${pkgver}
  make build
}

package() {
  _uuid='AlphabeticalAppGrid@stuarthayhurst'
  _install_dir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -d ${_install_dir}
  cd "${srcdir}"/${_pkgname}-${pkgver}
  unzip ${_uuid}.shell-extension.zip -d ${_install_dir}
  install -Dm644 "schemas/org.gnome.shell.extensions.AlphabeticalAppGrid.gschema.xml" -t "${pkgdir}/usr/share/glib-2.0/schemas/"
}