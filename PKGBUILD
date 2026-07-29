# Maintainer: Mr.Wizard <process-pylon-62 at icloud.com>
pkgname=baresip-qt
pkgver=4.10.0_qt.1
pkgrel=1
pkgdesc="Baresip bundled with custom native Qt applet"
arch=('x86_64')
url="https://github.com/Venomtek/baresip-qt"
license=('BSD-3-Clause')

depends=('qt6-base' 'libre' 'openssl' 'opus')
makedepends=('cmake' 'git')

provides=('baresip')
conflicts=('baresip')

# Hardcoded direct git link to your repo. No tags or shortcuts to confuse curl.
source=("git+https://github.com/Venomtek/baresip-qt.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  # Compiles out of the folder created by cloning the repo name
  cmake -B build -S "${srcdir}/baresip-qt" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build -j
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}

