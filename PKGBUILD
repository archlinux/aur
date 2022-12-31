# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=pods
pkgver=1.0.1
pkgrel=1
pkgdesc="A Podman desktop application"
arch=('x86_64' 'aarch64')
url="https://github.com/marhkb/pods"
license=('GPL3')
depends=('libadwaita' 'libpanel' 'gtksourceview5' 'podman' 'vte4')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=("$pkgname-${pkgver//_/-}".tar.gz::$url/archive/v${pkgver//_/-}.tar.gz)
b2sums=('dea5c6e0fdff91144971042e7643ad84e637d9d2f03cb5a8100aa7c82cb01e1401c02e7b489fec9a2bb12611e1160b0105819fff3ff938c38f24f8162095010e')

build() {
  arch-meson "$pkgname-${pkgver//_/-}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
