# Maintainer: Toni500 <tonino512@linuxmail.org>
pkgname="oshot"
_pkgname="oshot"
pkgver=0.5.0
_rc=rc1
pkgrel=1
pkgdesc="A fast and lightweight screenshot tool for extracting text on the fly"
arch=('x86_64' 'aarch64')
url="https://github.com/Toni500github/oshot"
license=('BSD-3-Clause')
depends=(
  'libx11'
  'libxcb'
  'libpng'
  'glfw'
  'tesseract'
  'tesseract-data-eng'
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
    git checkout "tags/v${pkgver}-${_rc}"
}

build() {
    cd "${srcdir}/${_pkgname}"
    cmake -B build -S . \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
      -DDISABLE_PLUGINS=1

    cmake --build build
}

package() {
    cd "${srcdir}/${_pkgname}"
    cmake --install build
}
