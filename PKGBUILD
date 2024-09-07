# Maintainer: Shatur <genaloner@gmail.com>

pkgname=crow-translate-git
pkgver=2.11.1.r59.ga5d5462
pkgrel=1
pkgdesc='Application that allows you to translate and speak text'
arch=(x86_64 aarch64)
url=https://invent.kde.org/office/crow-translate
license=(GPL-3.0-or-later)
depends=(qt5-svg qt5-multimedia qt5-x11extras kwayland5 gst-plugins-good openssl tesseract)
makedepends=(extra-cmake-modules qt5-tools git)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(git+$url)
sha256sums=(SKIP)

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname%-git}
  git submodule init
  git submodule update
}

build() {
  cd ${pkgname%-git}

  cmake -B build -D CMAKE_INSTALL_PREFIX="$pkgdir/usr"
  cmake --build build
}

package() {
  cd ${pkgname%-git}

  cmake --install build
  rm -f "${pkgdir}/usr/share/icons/hicolor/icon-theme.cache"
}
