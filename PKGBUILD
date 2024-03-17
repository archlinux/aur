# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-dir-watch-media
pkgver=0.7.0
pkgrel=1
pkgdesc="Adds a filter you can add to media source to load the oldest or newest file in a directory"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/directory-watch-media.801/"
license=("GPL-2.0-or-later")
depends=("obs-studio>=28" "glibc")
makedepends=("cmake" "git")
options=('debug')
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=cc320fba63ac250eaefac6d0b8cc20f4bc88aa4f")
sha256sums=("SKIP")

build() {
  cmake -B build -S $pkgname \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DCMAKE_C_FLAGS="-Wno-error=deprecated-declarations" \
  -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
