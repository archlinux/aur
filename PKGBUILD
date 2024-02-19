# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-source-copy
pkgver=0.2.3
pkgrel=1
pkgdesc="Copy and paste scenes, sources and filters on clipboard"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/source-copy.1261/"
license=(GPL-2.0-or-later)
depends=("obs-studio>=28" "glibc" "gcc-libs" "qt6-base")
makedepends=("cmake" "git")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=2b7d5f9f1321f38a201fc789855256aa876dffed")
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
