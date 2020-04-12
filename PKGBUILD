# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
 
pkgname=vvave-git
pkgver=r685.335757e
pkgrel=2
pkgdesc="Music player for KDE"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://vvave.kde.org/"
license=(GPL3)
depends=(ki18n knotifications qt5-quickcontrols2 qt5-svg qt5-webengine qt5-websockets qt5-webview kio mauikit-git kirigami2
         gst-plugins-base gst-plugins-good gst-libav taglib)
makedepends=(git cmake extra-cmake-modules syntax-highlighting appstream)
optdepends=('gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs')
provides=(vvave)
conflicts=(vvave)
#replaces=(babe babe-qt babe-git)
source=("git+https://invent.kde.org/kde/vvave.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${pkgname%-git}"
  install -d build
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
