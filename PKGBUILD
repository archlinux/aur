# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-forge-git
_uuid=forge@jmmaranan.com
pkgver=77.r48.g42b5290
pkgrel=1
pkgdesc="Tiling and Window Manager for Gnome-Shell"
arch=('any')
url="https://github.com/forge-ext/forge"
license=('GPL-3.0-or-later')
depends=('gnome-shell')
makedepends=('git' 'less')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/forge-ext/forge.git')
sha256sums=('SKIP')

pkgver() {
  cd forge
  git describe --long --tags | sed 's/^v44-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd forge
  make build
}

package() {
  cd forge
  make INSTALL_PATH="$pkgdir/usr/share/gnome-shell/extensions/${_uuid}" install

  mv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share/"

  install -Dm644 schemas/org.gnome.shell.extensions.forge.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
