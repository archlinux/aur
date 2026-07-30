# Maintainer: SergioEduP <arch at sergioedup dot com>

pkgname=cow-wm-git
pkgver=0.1.rc.r121.g55a2c30
pkgrel=1
pkgdesc='cow is a stacking window manager using river as the compositor.'
arch=(x86_64)
url='https://codeberg.org/thomasadam/cow/'
license=(custom:ISC)

makedepends=(
  meson
  git
)

depends=(
  wayland
  river
  libxkbcommon
  pango
  cairo
  libbsd
  scdoc
  bison
  flex
)

optdepends=(
  'waybar: wayland status bar'
  'dunst: notification daemon'
  'wl-clip-persist: clipboard persistance after closing apps'
)

source=("${pkgname%-git}::git+https://codeberg.org/thomasadam/cow/")
b2sums=(SKIP)

pkgver() {
  cd $srcdir/${pkgname%-git}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/${pkgname%-git}
  arch-meson build
  meson compile -C build
}

package () {
  cd $srcdir/${pkgname%-git}
  meson install -C build --destdir $pkgdir
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
