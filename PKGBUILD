# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-source-dock
pkgver=0.3.4
pkgrel=1
pkgdesc="Plugin for OBS Studio allowing you to create a Dock for a source, which lets you interact, see audio levels, change volume and control media"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/source-dock.1317/"
license=("GPL2")
depends=("obs-studio>=28")
makedepends=("cmake" "git")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=e99736fb63c1dfb317d07e69e9aa6b60d775c19e")
sha256sums=("SKIP")

prepare()
{
  cd "$pkgname"
  sed -i "s|-Wswitch|-Wno-switch|" cmake/ObsPluginHelpers.cmake
}

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
