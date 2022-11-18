# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=text-engine-git
pkgver=r171.7c448f0
pkgrel=1
pkgdesc="A lightweight rich-text framework for GTK"
arch=('x86_64' 'aarch64')
url="https://github.com/mjakeman/${pkgname%-git}"
license=('LGPL3')
depends=('gtk4' 'json-glib' 'libxml2' 'libadwaita')
makedepends=('git' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 ${pkgname%-git}/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
