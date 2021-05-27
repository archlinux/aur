# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>

pkgname=gnome-shell-extension-improvedosk-git
pkgver=5+6+gcdb9936
pkgrel=1
pkgdesc="Makes GNOME's onscreen keyboard more useable."
url='https://github.com/SamLukeYes/improved-osk-gnome-ext'
license=('GPL3')
arch=('any')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
makedepends=('git')
depends=('gnome-shell')
optdepends=('ttf-symbola: Recommended font for symbols')
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed 's/^v//; s/-/+/g'
}

package() {
  cd ${pkgname}
  # Locate the extension.
  local _uuid="$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)"
  local _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  local _schemas="${pkgdir}/usr/share/glib-2.0/schemas"                  
                                                                          
  # Copy extension files into place.                                      
  install -d $_destdir $_schemas                                          
  install -m644 *.js* stylesheet.css $_destdir/                          
  install -m644 schemas/*.xml $_schemas  
}