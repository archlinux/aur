# Maintainer: Brightbites <brightbites667@gmail.com>
pkgname=tagstudio-bin
pkgver=9.6.3
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
sha256sums=('f4dc25e2f2a0e47e37f766baba48dc3cdddfbeed76821be20ff3206dfa827837'
            'c63d36f2b9056717fc1a3c0b56429ae485d8c7c95ddacceccfd76f5234222c27'
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