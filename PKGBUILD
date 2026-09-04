pkgname=skwd-paper-plasma
pkgver=1.0.0_beta.5
pkgrel=1
pkgdesc='KDE Plasma wallpaper integration for Skwd Paper'
arch=(x86_64)
url='https://github.com/liixini/skwd-paper-plasma'
license=(GPL-3.0-or-later)
depends=(libdrm libglvnd plasma-workspace qt6-base qt6-declarative "skwd-paper>=$pkgver")
makedepends=(cmake gcc pkgconf)
options=(!debug !lto)
source=("skwd-paper-plasma-1.0.0~beta.5-1.fc44.src.rpm::https://download.copr.fedorainfracloud.org/results/piixini/skwd-wall-v2/srpm-builds/10951112/skwd-paper-plasma-1.0.0beta.5-1.fc44.src.rpm")
sha256sums=('470cc1f2ad6ade29f42063a1af19ae28a98f336d2bebf05f19cdb707a7d6c54b')

prepare() {
  bsdtar -xf "$srcdir/skwd-paper-plasma-1.0.0~beta.5-1.fc44.src.rpm" -C "$srcdir"
  bsdtar -xf "$srcdir/skwd-paper-plasma-1.0.0-beta.5.tar.xz" -C "$srcdir"
}

build() {
  cmake -S "$srcdir/skwd-paper-plasma-1.0.0-beta.5" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build --parallel
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
