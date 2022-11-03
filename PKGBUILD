# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=pods
pkgver=1.0.0_beta.7
pkgrel=1
pkgdesc="A Podman desktop application"
arch=('x86_64' 'aarch64')
url="https://github.com/marhkb/pods"
license=('GPL3')
depends=('libadwaita' 'gtksourceview5' 'podman')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($url/archive/v${pkgver//_/-}.tar.gz)
b2sums=('ecc757f88e29bf20fb3e4087cb2b11aaf58f2607c5aa19d1e96e6db18a412abcd927997cf3d8bda5db846ae395a05ad5c159b198aaada6a9e97f3ac8c436976d')

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
