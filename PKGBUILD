# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-rounded-corners-git
_uuid=Rounded_Corners@lennart-k
pkgver=r34.571147a
pkgrel=1
pkgdesc="Adds rounded corners to every monitor in GNOME."
arch=('any')
url="https://github.com/lennart-k/gnome-rounded-corners"
license=('GPL-2.0-or-later')
depends=('gnome-shell')
makedepends=('git' 'zip')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/lennart-k/gnome-rounded-corners.git')
sha256sums=('SKIP')

pkgver() {
  cd gnome-rounded-corners
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd gnome-rounded-corners
  make zip
}

package() {
  cd gnome-rounded-corners
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  install -Dm644 schemas/org.gnome.shell.extensions.lennart-k.rounded_corners.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
