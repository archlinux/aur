pkgname=skwd-paper-plasma
pkgver=1.0.0_beta.11
pkgrel=1
pkgdesc='KDE Plasma wallpaper integration for Skwd Paper'
arch=(x86_64)
url='https://github.com/liixini/skwd-paper-plasma'
license=(GPL-3.0-or-later)
depends=(libdrm libglvnd plasma-workspace qt6-base qt6-declarative qt6-tools skwd-paper)
makedepends=(cmake gcc pkgconf)
options=(!debug !lto)
source=("skwd-paper-plasma-1.0.0~beta.11-1.fc44.src.rpm::https://download.copr.fedorainfracloud.org/results/piixini/skwd-wall-v2/srpm-builds/10968215/skwd-paper-plasma-1.0.0beta.11-1.fc44.src.rpm")
sha256sums=('236b184b42051c54f6ed76b14e958ae132cd1874a11054c9403eef4581405b9c')

prepare() {
  bsdtar -xf "$srcdir/skwd-paper-plasma-1.0.0~beta.11-1.fc44.src.rpm" -C "$srcdir"
  bsdtar -xf "$srcdir/skwd-paper-plasma-1.0.0-beta.11.tar.xz" -C "$srcdir"
}

build() {
  cmake -S "$srcdir/skwd-paper-plasma-1.0.0-beta.11" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build --parallel
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
