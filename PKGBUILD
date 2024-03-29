# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Radeox <dawid.weglarz95@gmail.com>
pkgname=gnome-shell-extension-forge
_uuid=forge@jmmaranan.com
pkgver=77
pkgrel=1
pkgdesc="Tiling and Window Manager for Gnome-Shell"
arch=('any')
url="https://github.com/forge-ext/forge"
license=('GPL-3.0-or-later')
depends=('gnome-shell')
makedepends=('git')
_commit=3e41a8efb621dd7d95040b774a0970b94ed364f3  # tags/v44-77^0
source=("git+https://github.com/forge-ext/forge.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd forge
  git describe --tags | sed 's/^v44-//;s/-/+/g'
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
