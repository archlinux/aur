# Maintainer: Seined Koda <seinedk@gmail.com>
# Maintainer: Kainoa Kanter <kainoa@t1c.dev>
pkgname=kisel
pkgver=1.5.1
pkgrel=1
pkgdesc="Efficient launch of Windows programs"
arch=('x86_64')
url="https://github.com/seinedkoda/kisel"
license=('GPL-3.0-or-later')

options=('!debug' 'strip')

depends=(
  'qt6-base'
  'python'
  'icoutils'
)

optdepends=(
  'winetricks: Additional scripts for working with Wine prefix'
  'mangohud: Overlay for monitoring FPS, temperature, CPU/GPU load'
  'obs-vkcapture: Vulkan game capture plugin for OBS'
  'gamescope: SteamOS session compositing window manager'
)

makedepends=(
  'cmake'
  'ninja'
  'qt6-tools'
  'vulkan-headers'
)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8f69c1b40d89162961c798d5b11e65aa3a4c6a8317eb97a2a1a6c27ac7578946')

build() {
  cmake -B build -S "${pkgname}-${pkgver}" \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build -j $(nproc)
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}

