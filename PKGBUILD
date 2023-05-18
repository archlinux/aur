# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-replay-source
pkgver=1.6.12
pkgrel=1
pkgdesc="Plugin to (slow motion) instant replay sources from memory"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/replay-source.686/"
license=("GPL2")
depends=("obs-studio>=28")
makedepends=("cmake" "git" "libcaption")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#tag=$pkgver")
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
