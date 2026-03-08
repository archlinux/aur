# Maintainer: ywxt <ywxt@ywxt.org>
pkgname=dkitle-bin
pkgver=0.1.alpha
pkgrel=2
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

_tag=v0.1-alpha

source_x86_64=("${url}/releases/download/${_tag}/dkitle-linux-x86_64.tar.gz")
source_aarch64=("${url}/releases/download/${_tag}/dkitle-linux-aarch64.tar.gz")
sha256sums_x86_64=('3fbfded66a7bace80ed6cf2b7d51cc374daefc5f4ea46e99c3110503a76b0dbe')
sha256sums_aarch64=('a87eab7140848399df286581a03a09fb59e5ecd32924fbbe60d13f6393516a1a')

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
