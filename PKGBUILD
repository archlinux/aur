# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-source-record
pkgver=0.3.1
pkgrel=1
pkgdesc="Plugin for OBS Studio to add a filter that allows you to record a source"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/source-record.1285/"
license=("GPL2")
depends=("obs-studio>=28")
makedepends=("cmake" "git")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=4a543d3577d56a27f5f2b9aa541a466b37dafde0")
sha256sums=("SKIP")

build() {
  cd "$pkgname"
  cmake -B build \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DQT_VERSION=6

  make -C build
}

package() {
  cd "$pkgname"
  make -C build DESTDIR="$pkgdir/" install
}
