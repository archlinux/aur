# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>

pkgname="gnome-shell-extension-easyscreencast"
pkgver=0.9.7.2
pkgrel=1
pkgdesc="Provides a convienent top bar pop-down interface to configure the GNOME Shell Screencast Recording feature."
arch=('any')
url="https://github.com/iacopodeenosee/EasyScreenCast"
license=('GPL3')
depends=('gnome-shell')
provides=('gnome-shell-extension-easyscreencast')
conflicts=('gnome-shell-extensions-git' 'gnome-shell-extensions-easyscreencast')
install="gschemas.install"
source=("${pkgname}::https://github.com/iacopodeenosee/EasyScreenCast/archive/0.9.7.2.tar.gz")
sha512sums=('d4c4900ee89a478593b7e0bbc634c8f741a072559bf9c0358c9c5de916e307523ecdb6f2cab841d500e367f8d7bdc05dbf5594ba7bcafe993379d14fb4960218')

package() {
  cd "${srcdir}/EasyScreenCast-0.9.7.2"
  # Locate the extension.
  _extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"
  # Copy extension files into place.
  find -maxdepth 1 \( -iname '*.js*' -or -iname '*.css' -or -iname '*.ui' -or -iname '*.gtkbuilder' \) -exec install -Dm644 -t "${_destdir}" '{}' +
  find -maxdepth 2 \( -iname '*.svg*' \) -exec install -Dm644 -t "${_destdir}/images" '{}' +
  find -name '*.xml' -exec install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas" '{}' +
  cd "${srcdir}/EasyScreenCast-0.9.7.2/locale"
  for locale in */
    do
      install -Dm644 -t "${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
    done
  cd "${srcdir}/EasyScreenCast-0.9.7.2/locale-UI"
  for locale in */
    do
      install -Dm644 -t "${_destdir}/locale-UI/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
    done
}
