# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=damask-wallpaper
pkgver=0.1.5
pkgrel=1
pkgdesc="Automatically set wallpaper images from Internet sources"
arch=('x86_64')
url="https://gitlab.gnome.org/subpop/damask"
license=('GPL3')
depends=('libadwaita' 'libgee' 'libportal-gtk4' 'xdg-desktop-portal')
makedepends=('blueprint-compiler' 'meson' 'vala')
checkdepends=('appstream-glib')
source=("$url/-/archive/v$pkgver/damask-v$pkgver.tar.gz")
sha256sums=('6644efafbcc5f1231b29f8e4083c6e63837756b3cd8517445aa6a1d6bf7cb7a0')

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
