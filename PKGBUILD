# Maintainer: Joseph DiGiovanni <jdigiovanni78 at gmail dot com>

pkgname=gnome-shell-extension-wireless-hid
pkgver=15
pkgrel=1

source=("https://github.com/vchlum/wireless-hid/archive/refs/tags/${pkgver}.tar.gz")

sha256sums=('e746778e1c8196fffef15d6878929fc07cf973d673b6adc65cc2d2a8b79f1c96')

pkgdesc="Shows the battery of the wireless keyboards, mice, and game controllers"
arch=('any')
url="https://github.com/vchlum/wireless-hid"
license=('GPL3')
depends=('gnome-shell>=3.38')

_extension_name="wireless-hid"

build() {
  cd "${srcdir}/${_extension_name}-${pkgver}"
  make build
}

package() {
  cd "${srcdir}/${_extension_name}-${pkgver}/build"
  _uuid="${_extension_name}@chlumskyvaclav.gmail.com"
  _install_dir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -d "${_install_dir}"
  bsdtar -xvf "${_uuid}.zip" -C "${_install_dir}"
  
  install -Dm644 "${_install_dir}/schemas/org.gnome.shell.extensions.${_extension_name}.gschema.xml" -t "${pkgdir}/usr/share/glib-2.0/schemas/"
  install -Dm644 "${_install_dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
