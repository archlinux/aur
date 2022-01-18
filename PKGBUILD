# Maintainer: Eric Cheng <ericcheng@hey.com>

pkgname=gnome-shell-extension-alphabetical-grid-extension
_pkgname=alphabetical-grid-extension
pkgver=17.0
pkgrel=1
pkgdesc="Restore the alphabetical ordering of the app grid, removed in GNOME 3.38"
arch=('any')
url="https://github.com/stuarthayhurst/alphabetical-grid-extension"
license=('GPL3')
depends=('gnome-shell>=3.38')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('08105d6980e4ecf4df2ba7987575e76d7b9fa89ed4d03481f521f215fd49f9bc')

build() {
  cd "${srcdir}"/${_pkgname}-${pkgver}
  make build
}

package() {
  _uuid='AlphabeticalAppGrid@stuarthayhurst'
  _install_dir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -d ${_install_dir}
  cd "${srcdir}"/${_pkgname}-${pkgver}
  bsdtar -xvf ${_uuid}.shell-extension.zip -C ${_install_dir}
  install -Dm644 "schemas/org.gnome.shell.extensions.AlphabeticalAppGrid.gschema.xml" -t "${pkgdir}/usr/share/glib-2.0/schemas/"

  install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
