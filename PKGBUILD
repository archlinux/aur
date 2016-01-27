# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>

pkgname="gnome-shell-extension-easyscreencast"
pkgver=0.9.7.3
pkgrel=1
pkgdesc="Provides a convienent top bar pop-down interface to configure the GNOME Shell Screencast Recording feature."
arch=('any')
url="https://github.com/iacopodeenosee/EasyScreenCast"
license=('GPL3')
depends=('gnome-shell')
provides=("${pkgname}")
conflicts=("${pkgname}-git" 'gnome-shell-extensions-git')
install="gschemas.install"
source=("${pkgname}::https://github.com/iacopodeenosee/EasyScreenCast/archive/0.9.7.3.tar.gz")
sha512sums=('5bb45cf5056b9a6f48ee365f22ab7b033ff095fa4af91be4d541a0b2d9ca9c784b48b601c4092c6711fb5637c2d80f25e6de4eccd3577acd0bc511eae93cb279')

package() {
  cd "${srcdir}/EasyScreenCast-0.9.7.3"
  # Locate the extension.
  _extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"
  # Copy extension files into place.
  find -maxdepth 1 \( -iname '*.js*' -or -iname '*.css' -or -iname '*.ui' -or -iname '*.gtkbuilder' \) -exec install -Dm644 -t "${_destdir}" '{}' +
  find -maxdepth 2 \( -iname '*.svg*' \) -exec install -Dm644 -t "${_destdir}/images" '{}' +
  find -name '*.xml' -exec install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas" '{}' +
  cd "${srcdir}/EasyScreenCast-0.9.7.3/locale"
  for locale in */
    do
      install -Dm644 -t "${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
    done
}
