# Maintainer: Hiroaki Yamamoto <hrak1529@gmail.com>

_pkgname=labwc
pkgname=labwc-im-git
pkgver=0.8.4.r48.gc870043a
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox (git version with minimal text-input-v1 support)'
url="https://github.com/labwc/labwc"
arch=('x86_64')
license=('GPL2')
depends=('libpng' 'librsvg' 'pango' 'libsfdo' 'seatd' 'libwlroots-0.19.so' 'wayland' 'xorg-xwayland')
makedepends=('git' 'meson' 'scdoc' 'wayland-protocols')
optdepends=("bemenu: default launcher via Alt+F3")
conflicts=(labwc)
provides=(labwc)
source=("git+https://github.com/labwc/${_pkgname}.git"
        '0001-IME-support-text-input-v1.patch')
md5sums=('SKIP'
         'a62974a65da84d1d36a198e7b7c1538a')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  patch -Np1 -i ../0001-IME-support-text-input-v1.patch
}

build() {
  arch-meson -Dman-pages=enabled "$_pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
