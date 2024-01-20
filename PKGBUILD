# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-mullvad-indicator-git
_uuid=mullvadindicator@pobega.github.com
pkgver=45.r1.g7727c09
pkgrel=1
pkgdesc="GNOME extension to track Mullvad connectivity"
arch=('any')
url="https://github.com/Pobega/gnome-shell-extension-mullvad-indicator"
license=('Apache-2.0')
depends=('gnome-shell')
makedepends=('git' 'zip')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Pobega/gnome-shell-extension-mullvad-indicator.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  make
}

package() {
  cd "${pkgname%-git}"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf ${_uuid}.zip -C "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  install -Dm644 schemas/org.gnome.shell.extensions.MullvadIndicator.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
