# Maintainer: Brightbites <brightbites667@gmail.com>
pkgname=tagstudio-bin
pkgver=9.6.2
pkgrel=1
pkgdesc="A User-Focused Photo & File Management System (pre-compiled)"
arch=('x86_64')
url="https://github.com/TagStudioDev/TagStudio"
license=('GPL-3.0-only')
depends=(
    'libva'
    'libvdpau'
    'libxrandr'
    'pipewire'
    'qt6-base'
    'qt6-multimedia'
    'qt6-wayland'
    'ripgrep'
)

optdepends=('ffmpeg: audio/video thumbnails and playback'
            'unrar: RAR based files thumbnails'
            )

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TagStudioDev/TagStudio/releases/download/v${pkgver}/tagstudio_v${pkgver}_linux_x86_64.tar.gz"
        "tagstudio.desktop"
        "tagstudio.sh")
sha256sums=('5d31e38a6a409db0f96689b9efad9169d9e00819e1d3507fa3701a91d49e031f'
            'ecbf2c55fd51effbc2f35a7b89a609a500b52a9058c391211793e9474da7dd7c'
            'e6ad29638c27bd383044e3ef1b5755f8cb10ad1b712e315c3e05071786f64860')

package(){
    cd "$srcdir"

    #install the application itself
    install -dm755 "$pkgdir/usr/share/tagstudio/"
    cp -a * "$pkgdir/usr/share/tagstudio/"

    #add to /usr/bin
    chmod 755 "$pkgdir/usr/share/tagstudio/tagstudio.sh"
    mkdir "$pkgdir/usr/bin"
    mv "$pkgdir/usr/share/tagstudio/tagstudio.sh" "$pkgdir/usr/bin/tagstudio"

    #cleanup
    rm "$pkgdir/usr/share/tagstudio/${pkgname}-${pkgver}.tar.gz"
    rm "$pkgdir/usr/share/tagstudio//tagstudio.desktop"

    #install .desktop
    install -Dm644 "$srcdir/tagstudio.desktop" "$pkgdir/usr/share/applications/tagstudio.desktop"
}