# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-source-clone
pkgver=0.1.0
pkgrel=1
pkgdesc="Plugin for OBS Studio to clone sources"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/source-clone.1632/"
license=("GPL2")
depends=("obs-studio>=28")
makedepends=("cmake" "git")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=48f8a9dd6c566d95e64af049e03bcddba86177f7")
sha256sums=("SKIP")

build() {
  cd "$pkgname"
  cmake -B build \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF

  make -C build
}

package() {
  cd "$pkgname"
  make -C build DESTDIR="$pkgdir/" install
}
