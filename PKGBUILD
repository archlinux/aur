# Maintainer: Colin Wallace <wallacoloo@gmail.com>

pkgname=gnome-shell-extension-sound-output-device-chooser-git
_gitname=gse-sound-output-device-chooser
pkgver=r17.1baa9b3
pkgrel=1
pkgdesc="Shows a list of sound output devices (similar to gnome sound settings) in the status menu below the volume slider."
arch=('any')
url="https://github.com/kgshank/gse-sound-output-device-chooser"
license=('unknown')
depends=('gnome-shell')
makedepends=('git')
source=('git://github.com/kgshank/gse-sound-output-device-chooser.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  _uuid='sound-output-device-chooser@kgshank.net'
  
  cd "${_gitname}/${_uuid}"
  # Copy extension files into place.
  find -maxdepth 1 \( -iname '*.js*' -or -iname '*.css' -or -iname '*.ui' \) -exec install -Dm644 -t "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}" '{}' +
  find -maxdepth 2 \( -wholename '*schemas/*.xml' \) -exec install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" '{}' +
}
