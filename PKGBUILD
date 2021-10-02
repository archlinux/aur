# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-nightthemeswitcher
_pkgname=nightthemeswitcher-gnome-shell-extension
pkgver=52
pkgrel=3
pkgdesc="Automatically toggle your light and dark themes variants"
arch=('any')
url="https://gitlab.com/rmnvgr/nightthemeswitcher-gnome-shell-extension"
license=('GPL3')
groups=('gnome-shell-extensions')
depends=('gnome-shell>=1:41')
makedepends=('glib2')
source=("https://gitlab.com/rmnvgr/nightthemeswitcher-gnome-shell-extension/-/archive/52/nightthemeswitcher-gnome-shell-extension-52.tar.gz")
sha512sums=('5eda9a372e8adc757a37012a3c6c7d5223cec7bd9cde6f07e15c0d2a6da43167')

build() {
  cd "${srcdir}/nightthemeswitcher-gnome-shell-extension-52"
  make build
}

package() {
  cd "${srcdir}/nightthemeswitcher-gnome-shell-extension-52/src"
  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local schema=$(grep -Po '(?<="settings-schema": ")[^"]*' metadata.json).gschema.xml
  local destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"
  cd "${srcdir}/nightthemeswitcher-gnome-shell-extension-52/build"
  bsdtar -xf "${srcdir}/nightthemeswitcher-gnome-shell-extension-52/build/${uuid}.shell-extension.zip" \
    -C "${srcdir}/nightthemeswitcher-gnome-shell-extension-52/build"
  rm "${srcdir}/nightthemeswitcher-gnome-shell-extension-52/build/${uuid}.shell-extension.zip"
  install -dm755 "${destdir}"
  cp -r * "${destdir}"
  install -Dm644 "schemas/${schema}" \
    "${pkgdir}/usr/share/glib-2.0/schemas/${schema}"
}
