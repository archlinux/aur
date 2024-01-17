# Maintainer: Joseph DiGiovanni <jdigiovanni78 at gmail dot com>

pkgname=gnome-shell-extension-memento-mori
pkgver=9
pkgrel=1

source=("source.zip::https://extensions.gnome.org/extension-data/memento-moripaveloom.v${pkgver}.shell-extension.zip")

sha256sums=('820249d6699eb001ac380335810dae52818222e17b4d28c5a2536f9dd04949b3')

pkgdesc="Adds a counter to the panel which counts down the time you have left"
arch=('any')
url="https://github.com/paveloom-t/gnome-shell-memento-mori"
license=('GPL3')
depends=('gnome-shell>=3.38')
noextract=("source.zip")

package() {
  cd "${srcdir}"
  
  _extention_name="memento-mori"
  _uuid="${_extention_name}@paveloom"
  _install_dir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -d "${_install_dir}"
  bsdtar -xvf "source.zip" -C "${_install_dir}"
  chmod -R 644 "${_install_dir}"
  
  install -Dm644 "${_install_dir}/schemas/org.gnome.shell.extensions.${_extention_name}.gschema.xml" -t "${pkgdir}/usr/share/glib-2.0/schemas/"
  install -Dm644 "${_install_dir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
