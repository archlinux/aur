# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=kana
pkgver=1.4
pkgrel=1
pkgdesc="Learn Japanese characters"
arch=('x86_64')
url="https://gitlab.gnome.org/fkinoshita/kana"
license=("GPL-3.0-only")
depends=('gtk4' 'libadwaita')
makedepends=('meson' 'cargo')
source=("https://gitlab.gnome.org/fkinoshita/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha256sums=('ef9b8c897de992b1e0565de0607326b16280f378a1f4bd97aaf759087e9a1d5c')

prepare() {
  cd "${pkgname}-v${pkgver}"
  export CARGO_HOME="${srcdir}/CARGO_HOME"
  export RUSTUP_TOOLCHAIN=stable
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
  meson install -C build --no-rebuild --destdir "${pkgdir}"
}
