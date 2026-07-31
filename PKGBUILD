# Maintainer: shadwoash8 <shadowash8 at protonmail dot com>

pkgname=ashwc

pkgver=0.2.0
pkgrel=1
pkgdesc="a minimal wayland compositor with various layouts, animations and all the eye-candy"
arch=('x86_64')
url="https://github.com/shadowash8/ashwc"
license=('MIT')
depends=(
  'wayland'
  'libinput'
  'libdrm'
  'pixman'
  'libxkbcommon'
  'wlroots0.20'
  'scenefx0.5'
)
makedepends=(
  'git'
  'meson'
  'ninja'
  'wayland-protocols'
)
provides=('ashwc' 'wayland-compositor')
conflicts=('ashwc-git' 'ashwc-git-debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9201d11b3a4a01063742febf53b67cea8f8502aff7b980c9f84e114ecf63723f')

build() {
  arch-meson "${srcdir}/${pkgname}-${pkgver}" build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
