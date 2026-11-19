# Maintainer: Brightbites <brightbites667@gmail.com>
pkgname=tagstudio-bin
pkgver=9.6.4
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

options=('!debug')
options=('!strip')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TagStudioDev/TagStudio/releases/download/v${pkgver}/tagstudio_v${pkgver}_linux_x86_64.tar.gz"
        "tagstudio.desktop"
        "tagstudio.sh")
sha256sums=('c274d5762256a4db7322c704a6753162d4e7f95a3f19cd1dadd9cbe94ef53870'
            '2bcdb6b501ada4a5609243aa04d488852cfe755c6756e683dfee0f86e28ea58f'
            '512ed522e919e380e29db8d7ba9074bd056287e736448f17717b02cf9e8b8474')

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