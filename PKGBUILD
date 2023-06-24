# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-gradient-source
pkgver=0.3.2
pkgrel=1
pkgdesc="Gradient Source for OBS studio"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/gradient-source.1172/"
license=("GPL2")
depends=("obs-studio>=28" "glibc")
makedepends=("cmake" "git")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=70c0ed3ba1763692dfafcd28328fdf29c497b92d")
sha256sums=('SKIP')

prepare()
{
  cd "$pkgname"
  sed -i "s|-Wswitch|-Wswitch -Wno-error=format-truncation|" cmake/ObsPluginHelpers.cmake
}

build() {
  cmake -B build -S $pkgname \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
