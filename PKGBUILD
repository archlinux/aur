# Maintainer: Brightbites <brightbites667@gmail.com>
pkgname=tagstudio-bin
pkgver=9.6.0
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

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TagStudioDev/TagStudio/releases/download/v${pkgver}/tagstudio_linux_x86_64.tar.gz"
        "tagstudio.desktop")
sha256sums=('3d0e793321ca3063f4bd1c6836df2bf2177ac635f8177e38c135f4fd09243d3e'
            '0beb85ce69aff8eb223c02622a0f947f10c48a4a11c937e82b58e97295601227')

package(){
    cd "$srcdir"

    #install the application itself
    install -dm755 "$pkgdir/usr/share/tagstudio/"
    cp -a "$srcdir/tagstudio"/* "$pkgdir/usr/share/tagstudio/"

    #install .desktop
    install -Dm644 "$srcdir/tagstudio.desktop" "$pkgdir/usr/share/applications/tagstudio.desktop"
}

post_install(){
    alias tagstudio='/usr/share/tagstudio/tagstudio'
}
