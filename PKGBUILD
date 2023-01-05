pkgname=renderdoc
pkgver=1.24
pkgrel=1
pkgdesc="OpenGL and Vulkan debugging tool"
arch=(x86_64)
url="https://github.com/baldurk/renderdoc"
license=("MIT")
makedepends=("cmake" "python")
depends=("libx11" "libxcb" "mesa" "libgl" "qt5-base" "qt5-svg" "qt5-x11extras" "xcb-util-keysyms")
source=("https://github.com/baldurk/renderdoc/archive/v${pkgver}.tar.gz"
        "https://github.com/baldurk/renderdoc/releases/download/v${pkgver}/v${pkgver}.tar.gz.asc")
validpgpkeys=('1B039DB9A4718A2D699DE031AC612C3120C34695')
sha384sums=('960c89b8aa837f34b5d75776111275a32241c2e1ae4c503c2d4f31c017a850f2d128d71d7bd78ed92c0886366d83cda6'
            'SKIP')

build() {
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_VERSION_STABLE=ON \
        -DBUILD_VERSION_DIST_CONTACT="https://aur.archlinux.org/packages/renderdoc" \
        -DBUILD_VERSION_DIST_NAME="Arch" \
        -DBUILD_VERSION_DIST_VER="${pkgver}" \
        -B"${srcdir}/${pkgname}-${pkgver}"/build \
        -H"${srcdir}/${pkgname}-${pkgver}"
  cmake --build "${srcdir}/${pkgname}-${pkgver}"/build
}

package() {
  make DESTDIR="${pkgdir}" -C "${srcdir}/${pkgname}-${pkgver}"/build install
  mkdir -p "${pkgdir}/usr/share/licenses/$pkgname"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
