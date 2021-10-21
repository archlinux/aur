# Maintainer: Shatur <genaloner@gmail.com>

pkgname=crow-translate-git
pkgver=2.9.0.r0.g1757b41
pkgrel=1
pkgdesc='A simple and lightweight translator that allows you to translate and speak text using Google, Yandex Bing, LibreTranslate and Lingva'
arch=(x86_64 aarch64)
url=https://github.com/crow-translate/crow-translate
license=(GPL3)
depends=(qt5-svg qt5-multimedia qt5-x11extras gst-plugins-good openssl tesseract)
makedepends=(extra-cmake-modules qt5-tools git)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(git+$url)
sha256sums=(SKIP)

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
