# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=inspector
pkgdesc='Gives information about your system'
pkgver=0.1.8
pkgrel=1
arch=('aarch64' 'x86_64')
url="https://github.com/Nokse22/inspector"
license=('GPL3')
depends=('libadwaita' 'python')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  chmod +x "$pkgdir/usr/bin/$pkgname"
}
