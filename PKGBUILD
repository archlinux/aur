# Maintainer: Mizumo-prjkt <mizproject@proton.me>
pkgname=uli-git
pkgver=0.1.0.alpha
pkgrel=1
pkgdesc="Universal Linux Installer co-developed with Antigravity"
arch=('x86_64')
url="https://github.com/Mizumo-prjkt/uli"
license=('MIT')
depends=('qt6-base' 'libarchive' 'dbus' 'libisoburn' 'yaml-cpp')
makedepends=('cmake' 'make' 'git')
provides=("uli")
conflicts=("uli")
source=("git+https://github.com/Mizumo-prjkt/uli.git")
sha256sums=('SKIP')

pkgver() {
  cd "uli"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "uli" \
    -DULI_BUILD_ALL=ON \
    -DCMAKE_BUILD_TYPE=Release
  make -C build
}
package() {
  install -Dm755 build/uli_installer "${pkgdir}/usr/bin/uli_installer"
  install -Dm755 build/uli_patcher "${pkgdir}/usr/bin/uli_patcher"
  install -Dm755 build/compositor/uli_compositor "${pkgdir}/usr/bin/uli_compositor"
}
