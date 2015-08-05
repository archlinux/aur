# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>

pkgname="gnome-shell-extension-easyscreencast"
pkgver=0.9.7.1
pkgrel=1
pkgdesc="Provides a convienent top bar pop-down interface to configure the GNOME Shell Screencast Recording feature."
arch=('any')
url="https://github.com/iacopodeenosee/EasyScreenCast"
license=('GPL3')
depends=('gnome-shell')
provides=('gnome-shell-extension-easyscreencast')
conflicts=('gnome-shell-extensions-git' 'gnome-shell-extensions-easyscreencast')
install="gschemas.install"
source=("${pkgname}::https://github.com/iacopodeenosee/EasyScreenCast/archive/0.9.7.1.tar.gz")
sha512sums=('7865905782c6897d0b35cb5e3cf2209ff5d0dff2347bdf918c7f857aa0f515f8691de2ae76625b4dd33613715c8e76c206aec8f40824a76ce80596f7ce6f1420')

package() {
  cd "${srcdir}/EasyScreenCast-0.9.7.1"
  # Locate the extension.
  _extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"
  # Copy extension files into place.
  find -maxdepth 1 \( -iname '*.js*' -or -iname '*.css' -or -iname '*.ui' -or -iname '*.gtkbuilder' \) -exec install -Dm644 -t "${_destdir}" '{}' +
  find -maxdepth 2 \( -iname '*.svg*' \) -exec install -Dm644 -t "${_destdir}/images" '{}' +
  find -maxdepth 2 \( -wholename '*schemas/*' \) -exec install -Dm644 -t "${_destdir}/schemas" '{}' +
  cd "${srcdir}/EasyScreenCast-0.9.7.1/locale"
  for locale in */
    do
      install -Dm644 -t "${_destdir}/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
    done
  cd "${srcdir}/EasyScreenCast-0.9.7.1/locale-UI"
  for locale in */
    do
      install -Dm644 -t "${_destdir}/locale-UI/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
    done
}
