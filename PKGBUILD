pkgname=skwd-paper-plasma
pkgver=1.0.0_beta.8
pkgrel=1
pkgdesc='KDE Plasma wallpaper integration for Skwd Paper'
arch=(x86_64)
url='https://github.com/liixini/skwd-paper-plasma'
license=(GPL-3.0-or-later)
depends=(libdrm libglvnd plasma-workspace qt6-base qt6-declarative qt6-tools "skwd-paper>=$pkgver")
makedepends=(cmake gcc pkgconf)
options=(!debug !lto)
source=("skwd-paper-plasma-1.0.0~beta.8-1.fc44.src.rpm::https://download.copr.fedorainfracloud.org/results/piixini/skwd-wall-v2/srpm-builds/10952987/skwd-paper-plasma-1.0.0beta.8-1.fc44.src.rpm")
sha256sums=('3c1faa1f4487c731ed8efec6696731f299e06fc928cc0104b9fd3db332a67701')

prepare() {
  bsdtar -xf "$srcdir/skwd-paper-plasma-1.0.0~beta.8-1.fc44.src.rpm" -C "$srcdir"
  bsdtar -xf "$srcdir/skwd-paper-plasma-1.0.0-beta.8.tar.xz" -C "$srcdir"
}

build() {
  cmake -S "$srcdir/skwd-paper-plasma-1.0.0-beta.8" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build --parallel
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
