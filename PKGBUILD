pkgname=glace-git
pkgver=0.0.10
pkgrel=10
pkgdesc="Glace is a GObject library to manage Wayland clients and retrieve information about them"
arch=('any')
url="https://github.com/Fabric-Development/glace"
license=('AGPL-3.0')
depends=('glibc' 'gtk3')
makedepends=('meson' 'ninja' 'git' 'vala')  # Only make dependencies
maintainer="Rubin Bhandari <roobin.bhandari@gmail.com>"
source=('git+https://github.com/Fabric-Development/glace') # Git repository URL
sha256sums=('SKIP')  # Skip checksum verification for git sources

# Build the package using Meson
build() {
  cd "${srcdir}/glace"

  git checkout hyprland

  # Ensure build directory is clean
  rm -rf build

  # Setup the build directory with meson
  meson setup build --prefix=/usr -Dbuildtype=release --wipe
}

# Install the package
package() {
  cd "${srcdir}/glace"

  # Install using ninja
  ninja -C build install
}
