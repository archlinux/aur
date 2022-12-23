# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=pods
pkgver=1.0.0_rc.3
pkgrel=1
pkgdesc="A Podman desktop application"
arch=('x86_64' 'aarch64')
url="https://github.com/marhkb/pods"
license=('GPL3')
depends=('libadwaita' 'libpanel' 'gtksourceview5' 'podman' 'vte4')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($url/archive/v${pkgver//_/-}.tar.gz)
b2sums=('8c2479094eae5de502c7ac0d9b5df3b3a301bb07b07a88b1601f3cb2c99ec5fabaed1b878b6b601fc4f758aa298782735aff64fe3633a2fb9c1246acd29d89fa')

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
