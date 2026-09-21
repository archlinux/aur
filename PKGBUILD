pkgname=skwd-paper-plasma
pkgver=1.0.0_beta.18
pkgrel=1
pkgdesc='KDE Plasma wallpaper integration for Skwd Paper'
arch=(x86_64)
url='https://github.com/liixini/skwd-paper-plasma'
license=(GPL-3.0-or-later)
depends=(libdrm libglvnd plasma-workspace qt6-base qt6-declarative qt6-tools skwd-paper)
makedepends=(cmake gcc pkgconf)
options=(!debug !lto)
source=("skwd-paper-plasma-1.0.0~beta.18-1.fc44.src.rpm::https://download.copr.fedorainfracloud.org/results/piixini/skwd-wall-v2/srpm-builds/11018006/skwd-paper-plasma-1.0.0beta.18-1.fc44.src.rpm")
sha256sums=('627f025aee0d6b6f935eb48bd366c53cb21d7fecc8b0d9aea3802452fe8b18c6')

prepare() {
  bsdtar -xf "$srcdir/skwd-paper-plasma-1.0.0~beta.18-1.fc44.src.rpm" -C "$srcdir"
  bsdtar -xf "$srcdir/skwd-paper-plasma-1.0.0-beta.18.tar.xz" -C "$srcdir"
}

build() {
  cmake -S "$srcdir/skwd-paper-plasma-1.0.0-beta.18" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build --parallel
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
