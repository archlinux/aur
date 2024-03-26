# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=goverlay-git
pkgver=1.1.1.r2.g456fc8d
pkgrel=1
pkgdesc="A GUI to help manage Vulkan/OpenGL overlays"
arch=('x86_64')
url="https://github.com/benjamimgois/goverlay"
license=('GPL-3.0-or-later')
depends=('glu' 'mangohud' 'qt6pas')
makedepends=('git' 'lazarus-qt6')
checkdepends=('appstream' 'desktop-file-utils')
optdepends=(
  'mesa-utils: OpenGL preview'
  'ttf-dejavu: recommended font'
  'ttf-ubuntu-font-family: recommended font'
  'vulkan-tools: Vulkan preview'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/benjamimgois/goverlay.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  make LAZBUILDOPTS=--lazarusdir=/usr/lib/lazarus
}

check() {
  cd "${pkgname%-git}"
  make tests
}

package() {
  cd "${pkgname%-git}"
  make prefix=/usr libexecdir=/lib DESTDIR="$pkgdir/" install
}
