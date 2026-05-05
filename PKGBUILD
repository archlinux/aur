# Maintainer: Yury Zhelezko <yzhelezko@users.noreply.github.com>
pkgname=ferrisscope-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Rust-native, open-source desktop IDE for Kubernetes"
arch=('x86_64')
url="https://github.com/yzhelezko/FerrisScope"
license=('Apache-2.0')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3')
optdepends=('kubectl: required for embedded terminal exec/kubectl tabs')
provides=('ferrisscope')
conflicts=('ferrisscope' 'ferrisscope-git')
source=("${pkgname}-${pkgver}.deb::https://github.com/yzhelezko/FerrisScope/releases/download/v${pkgver}/FerrisScope_0.4.1_amd64-linux-x64.deb")
sha256sums=('b52ea8ada2d3de3a646954cb7f15bf917c85b7edd92b7c97245c401b1b284e4c')

package() {
    # Tauri's .deb is a standard data tarball — bsdtar can lay it
    # straight down into ${pkgdir} without dpkg.
    cd "${srcdir}"
    bsdtar -xf "${pkgname}-${pkgver}.deb"
    bsdtar -xf data.tar.* -C "${pkgdir}"
    rm -f "${pkgdir}"/control.tar.* "${pkgdir}"/data.tar.* "${pkgdir}"/debian-binary 2>/dev/null || true
}
