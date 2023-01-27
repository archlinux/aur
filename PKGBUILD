# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=damask-wallpaper
pkgver=0.1.3
pkgrel=1
pkgdesc="Automatically set wallpaper images from Internet sources"
arch=('x86_64')
url="https://gitlab.gnome.org/subpop/damask"
license=('GPL3')
depends=('libadwaita' 'libgee' 'libportal-gtk4' 'xdg-desktop-portal')
makedepends=('blueprint-compiler' 'meson' 'vala')
checkdepends=('appstream-glib')
source=("$url/-/archive/v$pkgver/damask-v$pkgver.tar.gz")
sha256sums=('a3793d52fcb06ad2da1dca0defb1b62a93b3fdcbbd21fc3b68b682f01a222385')

build() {
  arch-meson "damask-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
