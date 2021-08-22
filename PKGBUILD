# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
 
pkgname=vvave-git
pkgver=2.0.0.r5.g699e46b
pkgrel=1
pkgdesc="Music player for KDE"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://vvave.kde.org/"
license=(GPL3)
groups=(maui)
depends=(mauikit mauikit-filebrowsing mauikit-accounts taglib)
makedepends=(git cmake extra-cmake-modules)
optdepends=('gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs')
provides=(vvave)
conflicts=(vvave)
source=("git+https://invent.kde.org/kde/vvave.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  [[ -d build ]] || mkdir build
}

build() {
  cd "${pkgname%-git}/build"
  cmake .. 
  make
}
 
package() {
  cd "${pkgname%-git}/build"
  make DESTDIR="$pkgdir" install
}
