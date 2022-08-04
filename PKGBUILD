# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=citations
pkgver=0.5.0
pkgrel=1
pkgdesc="Manage your bibliographies using the BibTeX format"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/citations"
license=('GPL3')
depends=('libadwaita-git' 'poppler' 'gtksourceview5')
makedepends=('meson' 'cargo')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('6f18599b4ef53d079201d16496de282d59ac8e8980298f7372be658c96838c1125b938db600032e1c6573d1d7e376c4b071948326b912a63e75357a2594755b3')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
