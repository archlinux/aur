# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-media-controls
pkgver=0.3.6
pkgrel=1
pkgdesc="Add Media Controls Dock to OBS"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/media-controls.1032/"
license=("GPL2")
depends=("obs-studio>=28")
makedepends=("cmake" "git")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=b37f7ab24dcf40701e1f538c14f608a5a0db868b")
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