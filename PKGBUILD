# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Radeox <dawid.weglarz95@gmail.com>
pkgname=gnome-shell-extension-forge
_uuid=forge@jmmaranan.com
pkgver=72
pkgrel=2
pkgdesc="Tiling and Window Manager for Gnome-Shell"
arch=('any')
url="https://github.com/forge-ext/forge"
license=('GPL3')
depends=('gnome-shell<=1:44.6')
makedepends=('git')
_commit=bfecdb620a8f41d966de08b7751d443376d9474b  # tags v44-72^0
source=("git+https://github.com/forge-ext/forge.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/forge"
  git describe --tags | sed 's/^v44-//;s/-/+/g'
}

build() {
  cd "$srcdir/forge"
  make build
}

package() {
  cd "$srcdir/forge"
  make INSTALL_PATH="$pkgdir/usr/share/gnome-shell/extensions/${_uuid}" install

  cp -r temp/locale "$pkgdir/usr/share/"
  install -Dm644 schemas/org.gnome.shell.extensions.forge.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"/{locale,schemas}
}
