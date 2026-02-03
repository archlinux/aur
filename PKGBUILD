# Maintainer: Brightbites <brightbites667@gmail.com>
pkgname=tagstudio-bin
_pkgname=${pkgname%-bin}
pkgver=9.5.6
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
sha256sums=('b010e163eda7129b4b6c6d74e05d5de1866dd214ec90dd267b50a03ec72390ef'
            '42cbcfe8641c8cd86014628855b3aaf05ed3c6c08d0668607c451d48a4c67192')

package(){
    cd "$srcdir"

    #install the application itself
    XDG_DATA_HOME="${XDG_DATA_HOME:-usr/share}"
    install -dm755 "$pkgdir/$XDG_DATA_HOME/tagstudio/"
    cp -a "$srcdir/tagstudio"/* "$pkgdir/$XDG_DATA_HOME/tagstudio/"

    #install .desktop
    install -Dm644 "$srcdir/tagstudio.desktop" "$pkgdir/usr/share/applications/tagstudio.desktop"
}
