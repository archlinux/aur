# Maintainer: andrewb <andrea.benini96@gmail.com>

_pkgname=zoom
pkgname=zoom-x32
pkgver=5.1.412382.0614
pkgrel=1
pkgdesc="Video Conferencing and Web Conferencing Service"
arch=(i686)
url="https://zoom.us/"
provides=('zoom')
conflicts=('zoom')
license=('custom')
depends=('fontconfig' 'glib2' 'libpulse' 'libsm' 'ttf-font' 'libx11' 'libxcb'
    'libxcomposite' 'libxfixes' 'libxi' 'libxcursor' 'libxkbcommon-x11' 'libxrandr'
    'libxrender' 'libxshmfence' 'libxslt' 'mesa' 'nss' 'pulseaudio-alsa'
    'xcb-util-image' 'xcb-util-keysyms')
optdepends=('qt5-webengine: SSO login support'
       'picom: extra compositor needed by some window managers for screen sharing'
       'xcompmgr: extra compositor needed by some window managers for screen sharing')
options=(!strip)
source=(Zoom.desktop
        $_pkgname.xml
        https://zoom.us/client/latest/$_pkgname\_$arch.tar.xz)
sha256sums=('aefdb65e4ee95ef98920ce4b184e5d9cd11f83dd16ecbda66aea75bd3a079ea5'
            '33e326f0c2dc8312b2fcbe3debe181e15871e87b8afdbbcbbff5e057f23be867'
            'f21cf893041f839abfd8c063087fa0b82fe9ea448c3249c17a9ec89784686a94')


package() {
    install -dm755 "$pkgdir/opt"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share"

    # Program
    cp -r "$srcdir/$_pkgname" "$pkgdir/opt"
    cp -r "$srcdir/$_pkgname/doc" "$pkgdir/usr/share/"

    # Launcher and mime
    ln -s /opt/$_pkgname/ZoomLauncher "$pkgdir/usr/bin/$_pkgname"
    install -D Zoom.desktop "$pkgdir/usr/share/applications/Zoom.desktop"
    install -D $_pkgname.xml "$pkgdir/usr/share/mime/packages/$_pkgname.xml"
}

