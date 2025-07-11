# Maintainer: Your Name <your@email.com>
pkgname=krunner-bazaar
pkgver=1.0.4 # Get the actual version from CMakeLists.txt or a tag
pkgrel=1
pkgdesc="KRunner plugin for Browse installed applications based on categories"
arch=('x86_64')
url="https://github.com/ublue-os/krunner-bazaar"
license=('Apache-2.0') # Check the project's license
depends=('qt6-base' 'krunner' 'ki18n' 'kcoreaddons') # Add any other runtime dependencies
makedepends=('cmake' 'extra-cmake-modules' 'git')
source=("$pkgname::git+$url.git#tag=v$pkgver") # Or use a specific tag/commit if you prefer
sha256sums=('SKIP') # Use 'SKIP' for git sources, or a real sum for tarballs

build() {
  cd "$pkgname"
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF # Often good to disable tests for package builds
  cmake --build build -j$(nproc)
}

package() {
  cd "$pkgname"
  cmake --install build --prefix="$pkgdir/usr"
}
