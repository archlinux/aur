# Maintainer: ywxt <ywxt@ywxt.org>
pkgname=dkitle-bin
pkgver=0.1.beta
pkgrel=3
pkgdesc="A desktop application for dkitle"
arch=('x86_64' 'aarch64')
url="https://github.com/ywxt/dkitle"
license=('MIT')
provides=('dkitle')
conflicts=('dkitle')
depends=('gcc-libs' 'glibc')
optdepends=(
    'vulkan-icd-loader: GPU rendering via wgpu/Vulkan backend'
    'libxkbcommon: keyboard input support'
    'libx11: X11 display support'
    'wayland: Wayland display support'
    'fontconfig: system font discovery'
    'freetype2: font rendering'
)
options=('!strip')

_tag=v0.1-beta

source_x86_64=("dkitle-${pkgver}-linux-x86_64.tar.gz::${url}/releases/download/${_tag}/dkitle-linux-x86_64.tar.gz")
source_aarch64=("dkitle-${pkgver}-linux-aarch64.tar.gz::${url}/releases/download/${_tag}/dkitle-linux-aarch64.tar.gz")
sha256sums_x86_64=('e0e0ddce3f9a6a31239fd559d4024946710e626b6b470c384808f14ffdf84552')
sha256sums_aarch64=('e92a0d31febbe410d9a70fcc9f29f17ada0019030515b9c85b8b71a8e556a6e6')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        cd "${srcdir}/dkitle-linux-x86_64"
    elif [[ "$CARCH" == "aarch64" ]]; then
        cd "${srcdir}/dkitle-linux-aarch64"
    fi

    # Install binary
    install -Dm755 dkitle-app "${pkgdir}/usr/bin/dkitle-app"

    # Install desktop file
    install -Dm644 dkitle.desktop "${pkgdir}/usr/share/applications/dkitle.desktop"

    # Install icon
    install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/dkitle.png"
}
