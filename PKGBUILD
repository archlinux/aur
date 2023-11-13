# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=kana
pkgver=1.2
pkgrel=1
pkgdesc="Learn Japanese characters"
arch=('x86_64')
url="https://gitlab.gnome.org/fkinoshita/kana"
license=("GPL3")
depends=('gtk4' 'libadwaita')
makedepends=('meson' 'rust')
source=("https://gitlab.gnome.org/fkinoshita/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha256sums=('ad8987b25086a1db74a3517db574e2329e190d181e2f642781686e4e55c335de')

prepare() {
  cd "${pkgname}-v${pkgver}"
  meson subprojects download
}

build() {
  cd "${pkgname}-v${pkgver}"
  arch-meson build
  meson compile -C build
}

check() {
  cd "${pkgname}-v${pkgver}"
  meson test -C build --print-errorlogs
}

package() {
  cd "${pkgname}-v${pkgver}"
  meson install -C build --destdir "${pkgdir}"
}

