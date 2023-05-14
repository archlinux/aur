# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=badabib
_pkgname=BadaBib
pkgver=0.8.1
pkgrel=1
pkgdesc="Bada Bib! is a simple BibTeX Viewer and Editor written in Python and GTK"
arch=('x86_64' 'aarch64')
url="https://github.com/RogerCrocker/BadaBib"
license=('GPL3')
depends=('libadwaita' 'python-bibtexparser' 'python-watchgod')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('59672611d54ec67bf098c89169040e8fb9dcf9585b466141292cea41f709af3ffd4fd869e6bca3f1d0cac53567c7cca52eb44bb59fcf27e53c037b0ce490725b')

build() {
  arch-meson $_pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
