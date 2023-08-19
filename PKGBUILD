# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-disconnect-wifi-git
_uuid=disconnect-wifi@kgshank.net
pkgver=31.r0.g35277ae
pkgrel=1
pkgdesc="Adds a disconnect option for Wifi in status menu"
arch=('any')
url="https://github.com/kgshank/gse-disconnect-wifi"
license=('GPL3')
depends=('gnome-shell')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/kgshank/gse-disconnect-wifi.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/gse-disconnect-wifi"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/gse-disconnect-wifi"
  make
}

package() {
  cd "$srcdir/gse-disconnect-wifi"
  make INSTALL_DIR="$pkgdir/usr/share/gnome-shell/extensions/" install

  install -Dm644 "$_uuid/schemas/org.gnome.shell.extensions.disconnect-wifi.gschema.xml" -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"

  mv "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/locale" "$pkgdir/usr/share/"

  rm "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"/{disconnect-wifi.pot,license}
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas/"
}
