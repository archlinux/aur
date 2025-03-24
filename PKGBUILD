# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-source-record
pkgver=0.4.5
pkgrel=1
pkgdesc="Plugin for OBS Studio to add a filter that allows you to record a source"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/source-record.1285/"
license=(GPL-2.0-or-later)
depends=("obs-studio>=29" "glibc")
makedepends=("cmake" "git")
options=("debug")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=b588b63bf0037ca9bc6e30859a38341c9fa99ae7")
sha256sums=("SKIP")

build() {
  cmake -B build -S "$pkgname" \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DQT_VERSION=6 \
  -DCMAKE_C_FLAGS="-Wno-error=deprecated-declarations" \
  -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
