# Maintainer: Hiroaki Yamamoto <hrak1529@gmail.com>

# Based on labwc AUR from Lex Black <autumn-wind@web.de>

pkgname=labwc-im
pkgver=0.9.2
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox (with text-input-v1 support)'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL2')
depends=('libpng' 'librsvg' 'libsfdo' 'pango' 'seatd' 'libwlroots-0.19.so' 'wayland' 'xorg-xwayland')
makedepends=('meson' 'scdoc' 'wayland-protocols')
optdepends=("bemenu: default launcher via Alt+F3")
conflicts=(labwc)
provides=(labwc)
source=(labwc-${pkgver}.tar.gz::"https://github.com/labwc/labwc/archive/${pkgver}.tar.gz"
        '0001-IME-support-text-input-v1.patch')
b2sums=('2e771bcef5a05988d57c8bd6deef6392271bc68f1caf347de1d96e39c711b1519d0ec679ea730b3f8b8779e7a5bbd39950563fcd15d6ec4700e3e83bcbfe792c'
        '1c83e32151ab2c3869f9bda15280eef7dfe78545ca2b1ee5bb62a2bf5374203a3306d7dbfa4eee3dd3aa97198e3f45b1ea24279fd9b24e7d5882abb8986c9205')

prepare() {
  cd "labwc-$pkgver"
  patch -Np1 -i ../0001-IME-support-text-input-v1.patch
}

build() {
  arch-meson -Dman-pages=enabled "labwc-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
