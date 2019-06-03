# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=sway
pkgver=1.1.1
pkgrel=1
pkgdesc='Tiling Wayland compositor and replacement for the i3 window manager'
arch=(x86_64)
url='https://swaywm.org/'
license=(MIT)
depends=(cairo gdk-pixbuf2 json-c pango pcre ttf-font 'wlroots>=0.6.0')
makedepends=(meson ninja scdoc wayland-protocols)
optdepends=(
  'dmenu: for launching applications'
  'i3status: display a status line'
  'rxvt-unicode: default terminal emulator'
  'xorg-server-xwayland: X11 support'
)
validpgpkeys=("9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A") # Drew DeVault
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/swaywm/$pkgname/archive/$pkgver.tar.gz"
  "https://github.com/swaywm/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz.sig"
)
sha256sums=('740bf97556c54da83937a255113d715aaa05e05b44d61fbe85e01b53ff1f9922'
            'SKIP')

build() {
  mkdir -p build
  arch-meson build $pkgname-$pkgver -D werror=false -D b_ndebug=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et
