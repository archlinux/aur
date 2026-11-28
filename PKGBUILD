# Maintainer: Toni500 <tonino512@linuxmail.org>
_pkgver=0.5.0-rc3
pkgname="oshot"
_pkgname="oshot"
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A fast and lightweight screenshot tool for extracting text on the fly"
arch=('x86_64' 'aarch64')
url="https://github.com/Toni500github/oshot"
license=('BSD-3-Clause')
depends=(
  'libx11'
  'libxrandr'
  'libpng'
  'sdl3'
  'tesseract'
  'zbar'
  'libappindicator-gtk3'
)
makedepends=('base-devel' 'cmake')
optdepends=(
	'grim: wlroots-based compositor screen capture'
	'wl-clipboard: Wayland clipboard'
)
conflicts=('oshot-git' 'oshot-bin')
source=("git+${url}.git")
sha256sums=("SKIP")

prepare() {
    cd "${srcdir}/${_pkgname}"
    git checkout "tags/v${_pkgver}"
}

build() {
    cd "${srcdir}/${_pkgname}"
    cmake -B build -S . \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
      -DDISABLE_PLUGINS=OFF

    cmake --build build
}

package() {
    cd "${srcdir}/${_pkgname}"
    cmake --install build
}
