pkgname=skwd-paper-plasma
pkgver=1.0.0_beta.9
pkgrel=1
pkgdesc='KDE Plasma wallpaper integration for Skwd Paper'
arch=(x86_64)
url='https://github.com/liixini/skwd-paper-plasma'
license=(GPL-3.0-or-later)
depends=(libdrm libglvnd plasma-workspace qt6-base qt6-declarative qt6-tools skwd-paper)
makedepends=(cmake gcc pkgconf)
options=(!debug !lto)
source=("skwd-paper-plasma-1.0.0~beta.9-1.fc44.src.rpm::https://download.copr.fedorainfracloud.org/results/piixini/skwd-wall-v2/srpm-builds/10955595/skwd-paper-plasma-1.0.0beta.9-1.fc44.src.rpm")
sha256sums=('74702b1d2c9a73dec525548ea5bc8cce64fc6ecfeff68741d70f3bbc12b01c9b')

prepare() {
  bsdtar -xf "$srcdir/skwd-paper-plasma-1.0.0~beta.9-1.fc44.src.rpm" -C "$srcdir"
  bsdtar -xf "$srcdir/skwd-paper-plasma-1.0.0-beta.9.tar.xz" -C "$srcdir"
}

build() {
  cmake -S "$srcdir/skwd-paper-plasma-1.0.0-beta.9" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build --parallel
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
