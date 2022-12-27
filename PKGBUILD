# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-source-copy
pkgver=0.2.2
pkgrel=1
pkgdesc="Copy and paste scenes, sources and filters on clipboard"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/source-copy.1261/"
license=("GPL2")
depends=("obs-studio>=28")
makedepends=("cmake" "git")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=2a325813e969f6c62b1d413195a1340c4a2a40e4")
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
