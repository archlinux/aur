# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=damask-wallpaper
pkgver=0.2.0
pkgrel=1
pkgdesc="Automatically set wallpaper images from Internet sources"
arch=('x86_64')
url="https://gitlab.gnome.org/subpop/damask"
license=('GPL3')
depends=('json-glib' 'libadwaita' 'libgee' 'libportal-gtk4' 'libsoup3' 'xdg-desktop-portal')
makedepends=('blueprint-compiler' 'meson' 'vala')
checkdepends=('appstream-glib')
source=("$url/-/archive/v$pkgver/damask-v$pkgver.tar.gz")
sha256sums=('cf6946277733805c9954a69945b878ffb5b05f63c28c0391a7f660b33b5d9407')

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
