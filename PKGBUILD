# Maintainer: Hiroaki Yamamoto <hrak1529@gmail.com>

# Based on labwc AUR from Lex Black <autumn-wind@web.de>

pkgname=labwc-im
pkgver=0.8.2
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox (with text-input-v1 support)'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL2')
depends=('libpng' 'librsvg' 'libsfdo' 'pango' 'seatd' 'libwlroots-0.18.so' 'wayland' 'xorg-xwayland')
makedepends=('meson' 'scdoc' 'wayland-protocols')
optdepends=("bemenu: default launcher via Alt+F3")
conflicts=(labwc)
provides=(labwc)
source=(labwc-${pkgver}.tar.gz::"https://github.com/labwc/labwc/archive/${pkgver}.tar.gz"
        '0001-IME-support-text-input-v1.patch')
b2sums=('addcf8c12dc6c34a6f9e958db40bbfd8f85aec582e0507be1d3d7d2904175d5d1cea480c4ba3365167767e64c02c269ce6b34ad5cf81eec4ae3a34af1123eba8'
        '7fc6ec87da4775aec4f114b7a93b91060a5be11d6981b1b56546cb58cd400fcc61c78ebdc42100d378e3af61cf2fb5aa62dbb0de3f86cdf9ee86a14c9d18eb80')

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
