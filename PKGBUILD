# Maintainer: Francois Menning <f.menning@pm.m
# Contributer: Eric Cheng <eric@chengeric.com>

_pkgname=alphabetical-grid-extension
pkgname=gnome-shell-extension-alphabetical-grid-extension
pkgver=26.0
pkgrel=1
pkgdesc="Restore the alphabetical ordering of the app grid, removed in GNOME 3.38"
arch=('any')
url="https://github.com/stuarthayhurst/alphabetical-grid-extension"
license=('GPL3')
depends=('gnome-shell>=3.38')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('acb9d20b9d6b46de7309d03f27541445d350ae87e49fffcbca43b19baa882666')

build() {
  cd "${srcdir}"/${_pkgname}-${pkgver}
  make build
}

package() {
  cd "${srcdir}"/${_pkgname}-${pkgver}

  _uuid='AlphabeticalAppGrid@stuarthayhurst'
  _install_dir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -d ${_install_dir}
  bsdtar -xvf ${_uuid}.shell-extension.zip -C ${_install_dir}
  
  install -Dm644 "${_install_dir}/schemas/org.gnome.shell.extensions.AlphabeticalAppGrid.gschema.xml" -t "${pkgdir}/usr/share/glib-2.0/schemas/"
  install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
