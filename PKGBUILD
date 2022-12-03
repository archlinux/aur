# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-gradient-source
pkgver=0.3.1
pkgrel=1
pkgdesc="Gradient Source for OBS studio"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/gradient-source.1172/"
license=("GPL2")
depends=("obs-studio>=28")
makedepends=("cmake" "git")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=1753aa860102f44dfd440c708f8ca5f4ebd90640")
sha256sums=('SKIP')

prepare()
{
  cd "$pkgname"
  sed -i "s|-Wswitch|-Wswitch -Wno-error=format-truncation|" cmake/ObsPluginHelpers.cmake
}

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
