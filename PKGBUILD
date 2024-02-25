# Maintainer: Joseph DiGiovanni <jdigiovanni78 at gmail dot com>
# Contributer: Eric Cheng <eric at chengeric dot com>

pkgname=gnome-shell-extension-alphabetical-grid-extension
pkgver=39.0
pkgrel=1

source=("https://github.com/stuarthayhurst/alphabetical-grid-extension/archive/v${pkgver}.tar.gz")

sha256sums=('b3d55be9ebf35293e6ecbe1236341c0711b64beddfdc06874de48c4c68fd3410')

pkgdesc="Restore the alphabetical ordering of the app grid, removed in GNOME 3.38"
arch=('any')
url="https://github.com/stuarthayhurst/alphabetical-grid-extension"
license=('GPL3')
depends=('gnome-shell>=3.38')

_pkgname=alphabetical-grid-extension

build() {
  cd "${srcdir}"/${_pkgname}-${pkgver}
  make build
}

package() {
  cd "${srcdir}"/${_pkgname}-${pkgver}/build

  _uuid='AlphabeticalAppGrid@stuarthayhurst'
  _install_dir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -d ${_install_dir}
  bsdtar -xvf ${_uuid}.shell-extension.zip -C ${_install_dir}
  
  install -Dm644 "${_install_dir}/schemas/org.gnome.shell.extensions.AlphabeticalAppGrid.gschema.xml" -t "${pkgdir}/usr/share/glib-2.0/schemas/"
  install -Dm644 "${_install_dir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
