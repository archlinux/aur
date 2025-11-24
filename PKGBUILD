# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-disconnect-wifi-git
_uuid=disconnect-wifi@kgshank.net
pkgver=38.r0.g45637ef
pkgrel=1
pkgdesc="Adds a disconnect option for Wifi in status menu"
arch=('any')
url="https://github.com/kgshank/gse-disconnect-wifi"
license=('GPL-3.0-or-later')
depends=('gnome-shell')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/kgshank/gse-disconnect-wifi.git')
sha256sums=('SKIP')

pkgver() {
  cd gse-disconnect-wifi
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd gse-disconnect-wifi
  make
}

package() {
  cd gse-disconnect-wifi
  make INSTALL_DIR="$pkgdir/usr/share/gnome-shell/extensions/" install

  install -Dvm644 "${_uuid}"/schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"

  mv -v "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share/"

  rm -v "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/license"
  rm -rv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/"{po,schemas}
}
