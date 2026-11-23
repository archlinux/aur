# Maintainer: Seined Koda <seinedk@gmail.com>
# Maintainer: Kainoa Kanter <kainoa@t1c.dev>
pkgname=kisel
pkgver=1.5.2
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
sha256sums=('1ac4ec22c04fbd09c42400c673eeee6c6f00b5f6f64b6c7d3afdd34ef1cec95e')

build() {
  cmake -B "build-${pkgver}" -S "${pkgname}-${pkgver}" \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build "build-${pkgver}" --parallel
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build-${pkgver}"
}

